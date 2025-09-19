# Docker Hadoop (Experimental)
A simple Docker-based setup to run Hadoop locally for experimentation.  
This project uses community scripts and configurations — intended for **learning purposes only**.

## Features
- Run a pseudo-distributed Hadoop cluster in Docker
- Explore HDFS and MapReduce locally

## Notes
⚠️ This repo is experimental and mostly for personal learning.  
It borrows community configurations and is **not maintained for production**.

## Quick start
To deploy a example hadoop and yarn cluster, run
```bash
docker-compose -f docker-compose.yml up -d
```
