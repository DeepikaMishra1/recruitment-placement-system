from config.db_config import get_db_connection
from services.eligibility_engine import EligibilityEngine

def main():
    print("==================================================")
    print("   RECRUITMENT & PLACEMENT MANAGEMENT SYSTEM      ")
    print("==================================================\n")
    
    conn = get_db_connection()
    if conn:
        print("[SUCCESS] Connected to MySQL Database successfully!")
        conn.close()
    else:
        print("[ERROR] Failed to connect to database. Check your XAMPP/MySQL service.")

    print("\nSystem ready. Aap batayiye iske baad kaunsa module (Candidate Registration ya Job Creation) add karwana hai?")

if __name__ == "__main__":
    main()