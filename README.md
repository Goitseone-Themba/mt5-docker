### README.md

# MT5 Docker Setup

Runs 30 MetaTrader 5 (MT5) instances in Docker containers with Wine on a Linux server (e.g., Oracle Cloud). Keeps it simple for your trading setup.

## What’s Inside
- `Dockerfile`: Builds Ubuntu + Wine + MT5 container.
- `mt5setup.exe`: MT5 Windows installer.
- `configs/`: Sample MT5 config (`mt5-config.ini`) and bot script (`trading-bot.mq5`).
- `data/`: Persistent data for 30 instances (populated by scripts).
- `init_instances.sh`: Creates 30 data subfolders.
- `pre_populate_instances.sh`: Copies configs to data subfolders.
- `run_containers.sh`: Launches 30 MT5 containers.

## Prerequisites
- Docker installed (e.g., `sudo apt install docker.io` on Ubuntu, `sudo yum install docker` on Oracle Linux).

## How to Use
1. **Clone the Repo**
   ```bash
   git clone https://github.com/Goitseone-Themba/mt5-docker.git
   cd mt5-docker
   ```

2. **Build the Image**
   ```bash
   docker build -t mt5-container .
   ```

3. **Set Up Data**
   ```bash
   ./init_instances.sh        # Creates data/mt5-instance-1 to -30
   ./pre_populate_instances.sh # Copies configs to each instance
   ```

4. **Run 30 Containers**
   ```bash
   ./run_containers.sh
   ```

5. **Check Containers**
   ```bash
   docker ps
   ```

6. **Control MT5 (For Your Bot)**
   - SSH in, run:
     ```bash
     docker exec mt5-instance-1 wine /app/MetaTrader5/terminal64.exe --trade EURUSD buy 0.1
     ```
   - Use instance numbers 1–30.

## Notes
- Edit `configs/` with your MT5 settings/bot before Step 3.
- Resource limits: 0.25 CPU, 512MB RAM per container (adjust in `run_containers.sh`).
- Logs: `docker logs mt5-instance-1` if issues arise.

---
