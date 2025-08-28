# Day 02 — Processes & Cron

## 📖 What I Practiced
- Process management basics: `ps`, `top`, `pgrep`, `kill`
- Difference between `ps aux` (BSD style) and `ps -ef` (SysV style)
- Using `grep '[s]leep'` trick vs `pgrep` for cleaner PID search
- Viewing CPU/memory usage with `ps aux --sort`
- Monitoring processes with `top` and `top -H -p <PID>` (threads view)
- Sending signals with `kill`, difference between SIGTERM (15) and SIGKILL (9)
- Checking system uptime and interpreting load averages

## 📸 Screenshots

- Starting dummy processes 
  ![Jobs start](./screenshots/jobs_start.png)

- ps output (short vs aux vs -ef) 
  ![ps short](./screenshots/ps_short.png) 
  ![ps short1](./screenshots/ps_short1.png)
  ![ps aux](./screenshots/ps_aux.png)
  ![ps -ef](./screenshots/ps-ef.png)
  ![ps aux vs ps -ef](./screenshots/ps_aux_vs_ef.png)

- grep vs pgrep 
  ![grep vs pgrep](./screenshots/grep_vs_pgrep.png)

- top full view 
  ![top view](./screenshots/top_view.png)

- top threads view for one PID 
  ![top threads](./screenshots/top_threads.png)

- Killing processes (SIGTERM vs SIGKILL) 
  ![kill demo](./screenshots/kill_demo.png)

- uptime and load averages 
  ![uptime demo](./screenshots/uptime_demo.png)

## 💡 Key Takeaways
- `ps aux` is better for resource usage, `ps -ef` is better for parent-child tracing
- Always use `pgrep` in scripts (machine-friendly), `ps | grep` for quick checks
- `kill` = SIGTERM (15, graceful), `kill -9` = SIGKILL (force, last resort)
- Load average must be compared to number of CPU cores (`nproc`)
- Memory usage is better understood with `free -h` or `top`

---
📌 Next: convert this learning into a **process monitor script** and schedule with **cron** (Day-2 Part B).

