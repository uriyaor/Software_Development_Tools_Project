# Software Development Tools

## 📌 About the Project
This project provides setup, backup, restore and cleanup scripts for deploying a **Drupal** instance with **Docker** and **MySQL**. It ensures that the system is easily deployable, backed up, and restored when needed.

## 🚀 Getting Started
Follow these steps to set up and manage your Drupal instance using the provided scripts.

### 📂 Repository Structure
- **`setup.sh`** - Installs necessary dependencies and starts Drupal and MySQL containers.
- **`backup.sh`** - Backs up all MySQL databases into a compressed file.
- **`restore.sh`** - Restores the database from a backup file.
- **`cleanup.sh`** - Stops and removes all running containers and images.

---

## 🛠️ Technologies Used
- **Docker** - Containerization of MySQL and Drupal.
- **MySQL** - Database management system for Drupal.
- **Drush** - Drupal management CLI tool.
- **Composer** - PHP dependency manager.

---

## 📖 Installation Guide (Step-by-Step)
This guide will help you set up and run the project from scratch.

### 1️⃣ Clone the Repository
```bash
 git clone https://github.com/uriyaor/drupal-docker-backup.git
 cd drupal-docker-backup
```

### 2️⃣ Run the Setup Script
This script installs Docker, creates a network, and starts MySQL and Drupal containers.
```bash
chmod +x setup.sh
./setup.sh
```

### 3️⃣ Access the Drupal Site
Once the setup is complete, the Drupal site will be available at:
```
http://localhost:8080
```

### 4️⃣ Backup the Database
To create a backup of the MySQL database:
```bash
chmod +x backup.sh
./backup.sh
```
This will generate a compressed backup file `drupal_backup.sql.gz`.

### 5️⃣ Restore the Database
If you need to restore the database from a backup:
```bash
chmod +x restore.sh
./restore.sh
```
This downloads the latest backup from the repository and restores the database.

### 6️⃣ Cleanup the Environment
To stop and remove the containers and images:
```bash
chmod +x cleanup.sh
./cleanup.sh
```

---

## 📌 Additional Notes
- Ensure **Docker** is installed and running before executing the scripts.
- The **MySQL root password** is set to `my-secret-pw` (change in `setup.sh` if needed).
- The **Drupal admin credentials**:
  - **Username:** `demoadmin`
  - **Password:** `secretpass`
  - **Email:** `demoadmin@example.com`

---

## ❗ Troubleshooting
- If MySQL or Drupal fails to start, ensure the ports `8080` (Drupal) and `3306` (MySQL) are not in use.
- Run `docker ps -a` to check container statuses.
- Use `docker logs drupal_container` or `docker logs mysql_container` to debug issues.

---

## 👥 Contributors
- **Uriya Oren**, **Guy Simai**, **Sarit Rosenblum**
