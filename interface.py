import mysql.connector

def initialize():
    """
    Creates the database as root
    Person testing this will need to set up pwd as whatever their 
    local server password is
    """

    pwd = input("Please enter your root password")

    connect = mysql.connector.connect(
        host = "127.0.0.1",
        port = 3306,
        user = 'root',
        password = pwd)

    cur = connect.cursor() 
    cur.execute("use museum")
#Creates Database
    #Opens database, splits it by command (;)
    fd = open('museum_db.sql', 'r')
    sqlFile = fd.read()
    fd.close()
    sqlCommands = sqlFile.split(';')

    #Executes Database
    for command in sqlCommands:
        try:
            if (command.strip() != ''):
                cur.execute(command)

        except (IOError):
            print("Command skipped") # print("Command skipped: ", msg) is supposed to print the error but doesn't work. There's an error if something is wrong in the db either way, so I'm keeping it like this



def admin_interface(cur, cnx):
    """
    Allows user to type sql commands, create users, and generally just be an alpha male
    """
    user_selection = ""
    sqlCommand = ""

#Admin Interface
    while user_selection != "1" and user_selection != "2" and user_selection != "3":
        print("\n_-_-_-_Enter Option_-_-_-_")
        print("1. Type SQL command")
        print("2. Run an SQL script")
        print("3. Exit")
        print("Enter 1, 2, 3")
        user_selection = input("\nOption: ")

    #User enters an SQL command
        while user_selection == "1":
            print("Please enter an SQL command: (DO NOT USE A SEMICOLON) ")
            sqlCommand = input("")
            print("\n")

            cur.execute(sqlCommand)
            cnx.commit()

            for item in cur:
                print(item)

            #Updates user_selection
            while user_selection.lower() != "y" and user_selection.lower() != "n":
                print("\nRun another command? (Y / N)")
                user_selection = input("")

                if user_selection == "Y":
                    user_selection = "1"
                    break
                elif user_selection == "N":
                    user_selection = ""
                    break
                else:
                    print("Please enter a valid command") 

    #User enters an SQL script they would like to run
        while user_selection == "2":
            print("Please enter directory and filename of SQL script:")

            sql_file = input("")

            fd = open(sql_file, 'r')
            sqlFile = fd.read()
            fd.close()
            sqlCommands = sqlFile.split(';')

            for command in sqlCommands:
                try:
                    if (command.strip() != ''):
                        cur.execute(command)
                        cnx.commit()

                except (IOError):
                    print("ERROR")

                for item in cur:
                    print(item)
                
            #Updates user_selection
            while user_selection.lower() != "y" and user_selection.lower() != "n":
                print("\nRun another command? (Y / N)")
                user_selection = input("")

                if user_selection == "Y":
                    user_selection = "2"
                    break
                elif user_selection == "N":
                    user_selection = ""
                    break
                else:
                    print("Please enter a valid command")

        #User exits program
        if user_selection == "3":
            print("\nExiting database...")
            cur.close()
            exit()
            


def guest_interface(cur):
    """
    Browsing interface. Guest user can lookup data. Can't do much else
    """
    
    user_selection = ""

#Guest Interface
    while user_selection != "1" and user_selection != "2":
        print("\n_-_-_-_Enter option_-_-_-_")
        print("1. Browse database")
        print("2. Exit")
        print("Enter 1, 2")
        user_selection = input("\nOption: ")


        while user_selection == '1':
            print("\n_-_-_-_Enter option_-_-_-_")
            print("1.  Artists")
            print("2.  Art Objects")
            print("3.  Exhibitions")
            print("4.  Paintings")
            print("5.  Sculptures")
            print("6.  Statues")
            print("7.  Other")
            print("8.  Permanent Collection")
            print("9.  Borrowed Collection")
            print("10. Collection")
            print("11. Exit")
            print("Enter 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11")
            user_subselection = input("\nOption: ")

            if user_subselection == "1":
                cur.execute("select * from ARTIST")
                for item in cur:
                    print(item)
            elif user_subselection == '2':
                cur.execute("select * from ART_OBJECTS")
                for item in cur:
                    print(item)
            elif user_subselection == '3':
                cur.execute("select * from EXHIBITIONS")
                for item in cur:
                    print(item)
            elif user_subselection == '4':
                cur.execute("select * from PAINTING")
                for item in cur:
                    print(item)
            elif user_subselection == '5':
                cur.execute("select * from SCULPTURE")
                for item in cur:
                    print(item)
            elif user_subselection == '6':
                cur.execute("select * from STATUE")
                for item in cur:
                    print(item)
            elif user_subselection == '7':
                cur.execute("select * from OTHER")
                for item in cur:
                    print(item)
            elif user_subselection == '8':
                cur.execute("select * from PERMANENT_COLLECTION")
                for item in cur:
                    print(item)
            elif user_subselection == '9':
                cur.execute("select * from BORROWED")
                for item in cur:
                    print(item)
            elif user_subselection == '10':
                cur.execute("select * from COLLECTIONS")
                for item in cur:
                    print(item)
            elif user_subselection == "11":
                print("\nExiting database...")
                cur.close()
                exit()

            else:
                print("Unrecognized Option Selected")

            while user_selection.lower() != "y" and user_selection.lower() != "n"and user_selection.lower() != "":
                    print("\nRun another command? (Y / N)")
                    user_selection = input("")

                    if user_selection == "Y":
                        user_selection = "1"
                        break
                    elif user_selection == "N":
                        user_selection = ""
                        break
                    else:
                        print("Please enter a valid command")

        #User exits program

        if user_selection == "2":
            print("\nExiting database...")
            cur.close()
            exit()




def main():
    """
    main() function
    """

    # initialize()

    usr = ""
    pwd = ""
    user_selection = ""

#User login loop
    while user_selection != "1" and user_selection != "2" and user_selection != "3":
        print("\n_-_-_-_Museum Database_-_-_-_")
        print("Please select user type from list below")
        print("1. guest")
        print("2. admin")
        print("3. Exit")
        print("Enter 1, 2, 3")
        user_selection = input("\nUser: ")

        if user_selection == "1":
            usr = "guest"

        elif user_selection == "2":
            usr = "admstr"
            pwd = input("Password: ")

            while pwd != "admin":
                print("Incorrect Password, try again")
                pwd = input("Password: ")

        elif user_selection == "3": 
            print("\nExiting database...")
            exit()

#Initializes connection and cursor
    cnx = mysql.connector.connect(
        host = "127.0.0.1",
        port = 3306,
        user = usr,
        password = pwd) 

    cur = cnx.cursor(buffered = True) 
    cur.execute("use museum")

#Sends user to appropiate menu
    if user_selection == "1":
        guest_interface(cur)

    elif user_selection == "2":
        admin_interface(cur, cnx)




if(__name__ == "__main__"):
    main()