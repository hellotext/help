Use this guide when a custom API or Hellotext.js integration returns errors, creates duplicate records, or sends events that do not appear where expected.

Start with one recognizable customer and one request. Confirm each layer before testing a complete import or enabling playbooks.

## 1. Confirm the API token and business

Test the token from the backend:

```bash
curl --request GET \
  --url https://api.hellotext.com/v1/profiles?limit=1 \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN"
```

Check that:

- The header uses `Authorization: Bearer TOKEN`.
- The token has not been revoked.
- It belongs to the intended Hellotext business.
- It is loaded only in the backend environment.
- The business has access to the requested API operation.

Never paste the token into browser code, screenshots, tickets, or application logs.

## 2. Read the HTTP status before the response body

Hellotext uses standard HTTP status codes. Handle each category differently:

| Status | Meaning | What to do |
| --- | --- | --- |
| `400` | The request is malformed or a required parameter is missing. | Compare the body and content type with the API reference. |
| `401` | The token is missing, invalid, or revoked. | Replace or correct the token; do not retry unchanged. |
| `403` | The business or token cannot perform the operation, commonly because API access is unavailable for the current plan state. | Review business access and subscription status. |
| `404` | The resource, action, or business-scoped identifier was not found. | Confirm the ID and that it belongs to the same business as the token. |
| `422` | The request reached the endpoint but one or more values failed validation. | Read every returned error and correct the named parameter. |
| `500`, `502`, `503`, `504` | Hellotext or an upstream service had a temporary server problem. | Retry safely with progressive backoff. |

Validation responses include an `error` object or an `errors` collection with fields such as `type`, `message`, and `parameter`. Do not make decisions from the English message alone; retain the status and structured error type in your logs.

See [API errors](https://www.hellotext.com/api#errors).

## 3. Reduce the request to the smallest valid example

When a large payload fails:

1. Keep the same endpoint and credentials.
2. Send only the documented required fields.
3. Confirm the smallest request succeeds.
4. Add optional fields back one group at a time.
5. Compare the first failing field with its API contract.

Common `422` causes include:

- Missing required names or delivery values.
- An unsupported enum value.
- A product, order, coupon, action, property, or customer profile ID from another business.
- A duplicate unique reference, code, or SKU.
- A custom property that was not defined before assigning its value.
- Sending `currency` without `amount` on an event.
- An invalid `tracked_at` value.

## 4. Separate resource creation from event tracking

A resource and an event answer different questions:

- A product, order, coupon, or custom object describes **what** the activity involved.
- An event describes **what happened, to which customer, and when**.

If an order exists but no purchase appears on the customer profile, verify the event request. If an event fails because its object is missing, verify resource synchronization first.

For tracked events, confirm:

- The action name is exact and exists for the business.
- Either `profile` or `session` resolves correctly.
- `object` belongs to the expected resource type.
- `tracked_at` represents the original event time.
- `amount` and `currency` are both present when monetary value is sent.

## 5. Interpret a received event correctly

A valid tracking request returns HTTP `200` with:

```json
{
  "status": "received"
}
```

This confirms receipt for processing, not that every downstream profile, segment, playbook, and report has refreshed immediately.

If the event still does not appear after a reasonable processing interval:

1. Confirm the token and customer profile belong to the same business.
2. Confirm the action and object type match.
3. Check whether the event was sent with an old `tracked_at` value.
4. Confirm the same event was not already created by a native integration.
5. Inspect the customer profile activity before checking playbook or report results.

Use [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}) for the product-facing checks after the API request is valid.

## 6. Find the cause of duplicate records

Duplicates usually begin when identity changes between requests.

For customer profiles:

- Store the returned Hellotext profile ID.
- Normalize phone and email values before synchronization.
- Update the existing customer profile instead of creating one on every job.

For products and orders:

- Keep `source` constant.
- Keep `reference` constant.
- Keep SKUs stable and unique where used.
- Store the returned Hellotext ID.
- Do not let separate browser and backend implementations create parallel objects.

For events:

- Give each source event a stable internal ID.
- Keep an outbox or delivery record in your own system.
- Do not resend a request that already returned `status: received`.
- Deduplicate repeated source notifications before calling Hellotext.

## 7. Retry without creating uncertain duplicates

Safe retry behavior depends on the result:

- Do not retry `400`, `401`, `403`, `404`, or `422` unchanged.
- Retry temporary network and `5xx` failures with progressive backoff and a maximum attempt count.
- Add random delay when several workers can retry together.
- Stop retrying permanent validation errors and send them to a review queue.

A timeout is an unknown result: the server may have completed the request before the connection ended. Before repeating a resource-creation `POST`, reconcile your stored Hellotext ID, source reference, or recent API results.

The API does not expose a general idempotency-key parameter. Your integration must preserve its own source-event identifier and delivery state.

## 8. Log enough context without exposing secrets

For each API call, keep:

- Method and endpoint path.
- HTTP status.
- Structured error type and parameter.
- Source-system record or event ID.
- Hellotext resource ID when known.
- Request start time and duration.
- Attempt number.

Redact:

- Authorization tokens.
- Full phone numbers and email addresses.
- Message contents when they contain customer data.
- Complete request bodies containing personal or payment information.

## 9. Run an end-to-end diagnostic

Use this sequence to isolate the failing layer:

1. Authenticate with a one-record profile request.
2. Create or retrieve one customer profile.
3. Create or retrieve one product.
4. Track one product view against that customer profile.
5. Create one order using the same product.
6. Track one real order event.
7. Confirm the event on the customer profile.
8. Only then check segments, playbooks, and reports.

If the first failing step is clear, fix it before continuing. Later layers cannot compensate for an invalid resource or event.

## 10. Contact Hellotext with a reproducible example

If the documented request still fails, provide:

- Hellotext business or workspace identifier.
- Endpoint and HTTP method.
- Date, time, and timezone of the request.
- HTTP status and sanitized response body.
- Sanitized source reference and Hellotext resource ID.
- Whether the failure is consistent or intermittent.
- The smallest payload that reproduces the problem, without the token or unnecessary personal data.

See [Contact Hellotext support]({% link _troubleshooting-deliverability/contact-hellotext-support.md %}).

## Related guides

- [Integrate a custom store with Hellotext]({% link _developers/custom-store-integration.md %})
- [Sync products and understand inventory availability]({% link _developers/products-and-inventory-with-api.md %})
- [Create and track orders with the API]({% link _developers/orders-with-api.md %})
- [Create and track coupons with the API]({% link _developers/coupons-with-api.md %})
- [External tracking]({% link _developers/external-tracking.md %})
