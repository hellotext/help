When you connect your VTEX Store to Infobip with our Exchange app, you can:

- Sync your customer data to Profiles so that you can easily reach out to them via WhatsApp or SMS.
- Install Hellotext pixel that tracks customer activity on your website and reports back to Hellotext for better ROI and KPI measurement to aid in understanding how your campaigns perform.

### What you'll need

- A Hellotext account.
- API Base URI (for example: `https://hellotext.myvtex.com/` or `hellotext`)
- A VTEX account
- A VTEX application key and application token

### Setup Authentication

#### VTEX application keys

The My Keys page in VTEX lists all of the internal app keys. To access this page, go to **Account Settings** > and click on **API Keys**, then click on **Generate Key**.

<img src="images/integrations/vtex/en/installation.png" alt="" width="768" />

#### Generate a new application key

Application keys allow the external system to access your account, so your VTEX account must have this role: License Manager / Services access control / Save user.

1. Click the Generate New button.
2. In the Label field, enter the application key's purpose. It will help you identify the Hellotext key easily if you have other internal API keys.
3. Add **Roles** by clicking on it, which grants admin privilege to the API key.
4. Click on Generate.
5. You will see a link generated for the token. Copy the URL and paste it into your browser to obtain the key and the application token.
6. Copy the Key and the Application Token and save them in a safe place. They are only shown once.

#### Add the credentials to Hellotext

1. Log in to Hellotext and go to the business account you want to integrate the VTEX store into.
2. Go to Settings > Integrations and click on New Integration.
3. Choose VTEX in the list of available integrations.

Follow the wizard to set up your account. Make sure you copy and paste the App Key and App Token.
