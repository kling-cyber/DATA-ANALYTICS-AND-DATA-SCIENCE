import subprocess


def commit_push():
    # Add changed files
    subprocess.run(["git", "add", "."], check=True)

    # Check whether there is anything to commit
    result = subprocess.run(
        ["git", "status", "--porcelain"],
        capture_output=True,
        text=True
    )

    if not result.stdout.strip():
        print("Nothing to commit. Working tree is clean.")
        return

    # Commit changes
    subprocess.run(
        ["git", "commit", "-m", "hi"],
        check=True
    )

    # Push to GitHub
    subprocess.run(
        ["git", "push"],
        check=True
    )

    print("Successfully pushed to GitHub!")