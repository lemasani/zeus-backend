# Zeus Backend

This is the backend for the Zeus application, built with Node.js, Express, and Prisma.

## Table of Contents

- [Installation](#installation)
- [Configuration](#configuration)
- [Scripts](#scripts)
- [Project Structure](#project-structure)
- [Endpoints](#endpoints)
- [Database](#database)
- [License](#license)

## Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/zeus-backend.git
    cd zeus-backend
    ```

2. Install dependencies:
    ```sh
    npm install
    ```

## Configuration

1. Create a `.env` file in the root directory and add your database connection string:
    ```properties
    DATABASE_URL=mysql://root:@localhost:3306/zeus"  # local database
    ```

2. Update the `.env` file with your production database connection string when deploying:
    ```properties
    DATABASE_URL=mysql://root:@localhost:3306/zeus"
    ```

## Scripts

- Start the development server:
    ```sh
    npm run dev
    ```

- Build the project:
    ```sh
    npm run build
    ```

- Start the production server:
    ```sh
    npm start
    ```

## Project Structure




## Endpoints

### Tenant Routes

- `GET /tenant`
    - Description: Returns a greeting message from the tenant route.
    - Response: `Hello from tenant route`

## Database

This project uses Prisma as the ORM. The database schema is defined in the [`prisma/schema.prisma`] file. To deploy the schema to your production database, run:

```sh
npx prisma migrate deploy

