# DiagnoSysCLI
DiagnoSysCLI is a lightweight Windows-based command-line tool designed to gather key system diagnostics and present them
in a clear and readable format. It is used to check for system health, troubleshooting issues
and/or generating system reports without needing GUI tools.

# Features
- Retrieve system information such as OS, architecture, uptime
- Display CPU details such as model, cores and processing load
- Check memory usage (total, used, free)
- Report disk space (total, used, available)
- Test basic network connectivity overview
- Modular, customizable and extensible for developers

# Usage
## Help command:
```bash
diagnosys --help
```
Output:
```bash
DiagnoSysCLI v0.1
Usage: diagnosys [OPTIONS]
Options:
  --system       Show system info (OS, architecture, uptime)
  --cpu          Show CPU information
  --memory       Show memory statistics
  --disk         Show disk usage
  --network      Perform a basic network test (ping)
  --all          Run all diagnostics
  --help         Show this help message
  ```

## System Information
```bash
diagnosys --system
```

Output:
```bash
System Information
------------------
OS: Windows 10 (Build 19044)
Architecture: x64
Uptime: 3 days, 4 hours, 22 minutes
```

## CPU Check
```bash
diagnosys --cpu
```

Output:
```bash
CPU Information
---------------
Model: Intel(R) Core(TM) i7-9750H
Cores: 6 (12 threads)
Current Load: 28%
Base Speed: 2.60 GHz
```

## Memory Check
```bash
diagnosys --memory
```

Output:
```bash
Memory Usage
------------
Total: 16 GB
Used: 8.2 GB
Free: 7.8 GB
```

## Network Diagnostic
```bash
diagnosys --network
```

Output:

```bash
Network Diagnostics
-------------------
Default Gateway: 192.168.1.1
Public IP: 99.237.142.18
Ping Test: 8.8.8.8 (Google DNS) - OK (34 ms)
DNS Resolution: OK (google.com → 142.250.72.14)
Packet Loss: 0%
```

## Summary Board
```bash
diagnosys --all
```

Output:

```bash
DiagnoSysCLI Report
===================
[System] Windows 10 x64 | Uptime: 3d 4h 22m
[CPU] Intel i7-9750H | 6 cores (12 threads) | Load: 28%
[Memory] 8.2 GB / 16 GB used
[Disk] C:\ 120 GB free of 256 GB
[Network] Ping to 8.8.8.8: OK (32 ms)
```

# Installation
## MSI Installer
<!-- DiagnoSysCLI-x.y.z.msi -->
1. Download the latest MSI installer from the [Releases]() page:
2. Run the installer and follow the on-screen instructions
3. Check out our tutorial to get started

## From source
1. To build DiagnoSysCLI from source, you will need:
- C Compiler
- Git
- Unity (for tests)

2. Clone the repository and follow the steps illustrated below in your terminal
```bash
git clone https://github.com/daniel-akproh/diagnosys.git
```

