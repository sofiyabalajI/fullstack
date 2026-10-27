# PetStore Production Deployment Guide

This guide walks you through deploying the PetStore application to free-tier cloud platforms:
- **Database**: TiDB Cloud Serverless / Aiven for MySQL (Free Tier)
- **Backend**: Render Web Service (Free Tier)
- **Frontend**: Vercel (Free Tier)
- **Optional Local / VPS**: Docker Compose

---

## 1. Database Deployment (TiDB Cloud Serverless / Aiven MySQL)

### Step 1.1: Create Free Database Instance
1. Go to [TiDB Cloud](https://tidbcloud.com/) or [Aiven](https://aiven.io/).
2. Create a free MySQL-compatible database instance named `petstore`.
3. Note your credentials:
   - **Host** (e.g. `gateway01.us-east-1.prod.aws.tidbcloud.com`)
   - **Port** (typically `4000` for TiDB, `3306` for MySQL)
   - **Username**
   - **Password**
   - **Database Name** (e.g. `test` or `petstore`)

### Step 1.2: Seed Data
Run the following command from your terminal to import `Data_Base/data.sql`:
```bash
mysql -h <HOST> -P <PORT> -u <USERNAME> -p --ssl-mode=REQUIRED <DATABASE_NAME> < Data_Base/data.sql
```
*(Alternatively, copy and paste the contents of `Data_Base/data.sql` into the Cloud SQL console / DBeaver).*

---

## 2. Backend Deployment (Render)

### Step 2.1: Push Code to GitHub
Ensure your repository is pushed to GitHub.

### Step 2.2: Create Web Service on Render
1. Log in to [Render](https://render.com/).
2. Click **New +** > **Web Service**.
3. Connect your GitHub repository.
4. Set the following details:
   - **Root Directory**: `PetStoreApp_Backend/Project`
   - **Environment**: `Docker`
   - **Dockerfile Path**: `./Dockerfile`
   - **Instance Type**: `Free`
   - **Health Check Path**: `/api/health`

### Step 2.3: Configure Environment Variables
Under the **Environment** tab on Render, add:
| Key | Value |
| :--- | :--- |
| `PORT` | `8090` |
| `SPRING_DATASOURCE_URL` | `jdbc:mysql://<HOST>:<PORT>/<DATABASE_NAME>?useSSL=true&requireSSL=true` |
| `SPRING_DATASOURCE_USERNAME` | `<YOUR_DB_USER>` |
| `SPRING_DATASOURCE_PASSWORD` | `<YOUR_DB_PASSWORD>` |
| `FILE_UPLOAD_DIR` | `/app/uploads` |
| `JWT_SECRET` | `Ym9sdWRlLXByb2plY3Qtc2VjcmV0LWtleS1kZW1vLTEyMzQ1Njc4OTAtYWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXoxMjM0NTY3ODkwCg==` |

Click **Create Web Service**. Render will automatically build the multi-stage Docker image and launch the service.
Your live API URL will look like: `https://<your-service-name>.onrender.com`.

---

## 3. Frontend Deployment (Vercel)

### Step 3.1: Update Production API Endpoint
Open `PetStoreApp_Frontend/src/environments/environment.prod.ts` and set your Render URL:
```typescript
export const environment = {
  production: true,
  apiUrl: 'https://<your-backend-name>.onrender.com/api',
  imageUrl: 'https://<your-backend-name>.onrender.com/images/'
};
```
Commit and push this change to GitHub.

### Step 3.2: Deploy on Vercel
1. Log in to [Vercel](https://vercel.com/).
2. Click **Add New...** > **Project** and import your repository.
3. Configure project settings:
   - **Framework Preset**: `Angular`
   - **Root Directory**: `PetStoreApp_Frontend`
   - **Build Command**: `npm run build`
   - **Output Directory**: `dist/project/browser`
4. Click **Deploy**.
Vercel will build and host your Angular application with global CDN caching and HTTPS.

---

## 4. Alternative: One-Command Deployment (Docker Compose)

If deploying to a VPS (Ubuntu, Debian) or testing production containers locally:
```bash
# Start all 3 services (MySQL, Backend, Frontend)
docker compose up --build -d

# Check running status
docker compose ps

# View backend logs
docker compose logs -f backend
```
- Frontend: `http://localhost`
- Backend API: `http://localhost:8090/api`
- Health check: `http://localhost:8090/api/health`
