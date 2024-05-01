# Flutter Mobile Project Template

This is a template project for Android and iOS apps.

## About Environment

### Dev (Development)

- **Purpose**: The environment for developers to work on new features, enhancements, and bug fixes. Ideal for ongoing development and iterative testing.
- **Characteristics**: Characterized by frequent code updates and changes. Supports extensive debugging and experimental development.
- **Data**: Typically uses mock data or separate test databases to simulate various scenarios without affecting production data.

### Stg (Staging)

- **Purpose**: Serves as a pre-production environment, closely mirroring the production setup for final testing. Used for final checks before a release.
- **Characteristics**: Mimics the production environment in terms of hardware and software configuration. Focuses on performance testing, stability verification, and final QA processes.
- **Data**: May use data that is either a copy of production data (anonymized) or specially prepared testing data.

### Prd (Production)

- **Purpose**: The live environment where the application is available to its end users.
- **Characteristics**: Hosts the stable, released version of the application. Prioritizes high availability, scalability, and optimal performance.
- **Data**: Manages real user data and handles actual transactions.

### List of Environment Variables

|  | Dev | Stg | Prd |
|:-:|:-:|:-:|:-:|
| APP_NAME | dev-Template | stg-Template | Template |
| APP_ID | jp.co.yumemi.template.dev | jp.co.yumemi.template.stg | jp.co.yumemi.template |
