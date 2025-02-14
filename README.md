<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Drupal Docker Backup</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 20px;
            padding: 20px;
            background-color: #f4f4f4;
        }
        h1, h2, h3 {
            color: #333;
        }
        pre {
            background: #ddd;
            padding: 10px;
            border-radius: 5px;
        }
        code {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>Drupal Docker Backup</h1>
    <p>This project provides backup, restore, cleanup, and setup scripts for deploying a <strong>Drupal</strong> instance with <strong>Docker</strong> and <strong>MySQL</strong>.</p>
    
    <h2>🚀 Getting Started</h2>
    <h3>📂 Repository Structure</h3>
    <ul>
        <li><code>setup.sh</code> - Installs dependencies and starts Drupal & MySQL containers.</li>
        <li><code>backup.sh</code> - Backs up the MySQL database.</li>
        <li><code>restore.sh</code> - Restores the database from a backup.</li>
        <li><code>cleanup.sh</code> - Stops and removes containers.</li>
    </ul>
    
    <h2>📖 Installation Guide (Step-by-Step)</h2>
    <h3>1️⃣ Clone the Repository</h3>
    <pre><code>git clone https://github.com/uriyaor/drupal-docker-backup.git
cd drupal-docker-backup</code></pre>
    
    <h3>2️⃣ Run the Setup Script</h3>
    <pre><code>chmod +x setup.sh
./setup.sh</code></pre>
    
    <h3>3️⃣ Access the Drupal Site</h3>
    <p>Once the setup is complete, access it at:</p>
    <pre><code>http://localhost:8080</code></pre>
    
    <h3>4️⃣ Backup the Database</h3>
    <pre><code>chmod +x backup.sh
./backup.sh</code></pre>
    
    <h3>5️⃣ Restore the Database</h3>
    <pre><code>chmod +x restore.sh
./restore.sh</code></pre>
    
    <h3>6️⃣ Cleanup the Environment</h3>
    <pre><code>chmod +x cleanup.sh
./cleanup.sh</code></pre>
    
    <h2>👥 Contributors</h2>
    <p>Uriya, Guy, Sarit</p>
</body>
</html>
