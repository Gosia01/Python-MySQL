#-*-coding:utf-8-*-
import pymysql.cursors  

class Hotel:
    def __init__ (self):
        self.db = pymysql.connect(host='localhost',
                             user='root',
                             password='goziakowalska',                             
                             db='Hotel',
                             cursorclass=pymysql.cursors.DictCursor)
        self.cur=self.db.cursor()
        
        while(True):
            status=input("Czy chcesz się zalogować jako administrator czy jako użytkownik? \nNaciśnij A lub U. \nŻeby wyjść, naciśnij Q: \n")
            if(status.upper()=="A"):
                self.admin()
            elif(status.upper()=="U"):  
                self.user()
            elif(status.upper()=="Q"):
                print("Do widzenia")
                self.db.close()
                break
            else:
                print("Podałeś nieprawidłową literę")
                
    
    def admin(self):
        logA=str(input("Podaj login: "))
        passA=str(input("Podaj hasło: "))
        self.cur.execute('select login_admin from logowanie_admin where login_admin="%s";'%logA)
        
        dbuser = self.cur.fetchall()
        
        print(dbuser)
        if dbuser[0]['login_admin'] == logA:
            self.cur.execute('select count(*) from logowanie_admin where login="%s" and hasło="%s";' %(logA, passA))
            #self.cur.execute('select haslo_admin from logowanie_admin where haslo_admin="%s";' % passA)
            #dbpass = self.cur.fetchall()
            #print(dbpass)
            if dbpass[0]['haslo_admin'] == passA:
                return "True"
            else:
                return "Hasło jest prawidłowe"
        else:
            return "Login jest nieprawidłowy"            
            
                                    
    def user(self):
        logU=str(input("Podaj login: "))
        passU=str(input("Podaj hasło: "))                                    
        self.cur.execute('select login_admin from logowanie_admin where login_admin=logU;')
        dbuser = cur.fetchall()
        if dbuser == logU:
            cursor.execute('select haslo_admin from haslo_admin=passU;')
            dbpass = cur.fetchone()
            if dbpass == passU:
                return "True"
            else:
                return "Hasło jest prawidłowe"
        else:
            return "Login jest nieprawidłowy"                                      
hotel=Hotel()
                                


   

