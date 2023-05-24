import os


for week in range(1,10):

    folder_name = "Week_" + str(week)
    os.mkdir(folder_name)
    os.chdir(folder_name)

    if ( week not in [5,6,8,9] ):

        for day in range(1,6):

            subfolder_name = "Day_" + str(day)
            os.mkdir(subfolder_name)
            os.chdir(subfolder_name)

            for session in ["Morning", "Afternoon"]:
                
                if ( day != 5 ):
                    
                    sub_subfolder_name = session
                    os.mkdir(sub_subfolder_name)
                
                elif ( session == "Morning" ):
                    
                    sub_subfolder_name = session
                    os.mkdir(sub_subfolder_name)
                    
                else:
                    
                    continue
                    

            os.chdir("..")

        os.chdir("..")

    elif ( week==5 ):

        os.mkdir("Mid_bootcamp_project")
        os.chdir("..")

    elif ( week==6 ):

        os.mkdir("Song_recommender")

        for day in range(1,5):

            subfolder_name = "Day_" + str(day)
            os.mkdir(subfolder_name)
            os.chdir(subfolder_name)

            for session in ["Morning", "Afternoon"]:

                sub_subfolder_name = session
                os.mkdir(sub_subfolder_name)

            os.chdir("..")

        os.chdir("..")
        
    elif ( week==8 ):
        
        for day in range(1,5):

            subfolder_name = "Day_" + str(day)
            os.mkdir(subfolder_name)
            os.chdir(subfolder_name)

            for session in ["Morning", "Afternoon"]:

                sub_subfolder_name = session
                os.mkdir(sub_subfolder_name)

            os.chdir("..")

        os.chdir("..")

    elif ( week==9 ):

        os.mkdir("Final_project")
        os.chdir("..")



            



