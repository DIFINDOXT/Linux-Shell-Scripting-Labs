# Security Policy

## Supported Versions

We actively maintain and provide security updates for the following versions:

| Version | Supported          |
| ------- | ------------------ |
| Latest  | ✅ Yes             |
| < 1.0   | ❌ No              |

## Reporting a Vulnerability

We take the security of our Linux shell scripts seriously. If you discover a security vulnerability, please follow these steps:

### 🚨 For Critical Security Issues:
- **DO NOT** create a public GitHub issue
- Send an email to: **[shubhadeep010@.gmailcom]** 
- Include "SECURITY" in the subject line

### 📋 Include in Your Report:
- Description of the vulnerability
- Steps to reproduce the issue
- Potential impact assessment
- Suggested fix (if you have one)
- Your contact information for follow-up

### ⏱️ Response Timeline:
- **Initial Response**: Within 48-72 hours
- **Status Update**: Within 7 days
- **Fix Timeline**: 30 days (depending on severity)

### 🛡️ Security Best Practices for Users:

1. **Always review scripts** before executing them
2. **Run scripts in isolated environments** first
3. **Use proper file permissions** (avoid 777)
4. **Keep your system updated**
5. **Don't run scripts as root** unless necessary

### 🔍 Common Security Considerations:

- **Input validation** - Our scripts include input sanitization
- **Path traversal** - We use absolute paths where possible
- **Command injection** - Variables are properly quoted
- **File permissions** - Scripts set appropriate permissions

### 🏆 Hall of Fame

We recognize security researchers who help us improve:
- *No reports yet - be the first!*

## Disclosure Policy

- We will acknowledge your contribution (with your permission)
- We aim to fix critical issues within 30 days
- We will credit you in our security advisories

## Contact

For any security-related questions or concerns:
- 📧 Email: [shubhadeep010@gmail.com]
- 💬 GitHub Discussions: [Security Category]

---

**Note**: This security policy applies to all scripts and documentation in this repository. By using our code, you acknowledge that you understand and accept the security considerations involved with shell scripting.
