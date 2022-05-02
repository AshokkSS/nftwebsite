--
-- MATHFUN
-- Template for the Haskell assignment program (replace this comment)
-- Add your student number
--

--
-- Imports
--
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
{-# LANGUAGE BlockArguments #-}

import Data.List
import Text.Read
import Text.Printf

-- types
-- type Coords = (Double, Double)
-- type Name = [Char]
-- type Temp = [Double]

-- data Station = N Name | Coordinates Coords | T Temp deriving (Show, Eq) 

-- type Station = Station {
--     name :: String,
--     coordinates :: Coords,
--     temp :: [Double]
-- }

--data Station = Station {name :: String, coordinates :: Coords, temp :: [Double]}

type Station = (Name, Coords, Temp)
type Name = String
type Coords = (Double, Double)
type Temp = [Float]
data Month = Jan | Feb | Mar | Apr | May | Jun | Jul | Aug | Sep | Oct | Nov | Dec
           deriving (Eq,Ord,Show,Read)

testData :: [Station]
testData =
    [
    ("Mumbles Head", (51.565, -3.981), [8.26, 8.33, 9.84, 12.36, 15.24, 17.83, 19.55, 19.67, 17.97, 14.70, 11.49, 9.09]),
    ("Greenwich Park", (51.477, 0.004), [8.47, 9.21, 12.07, 15.35, 18.59, 21.37, 23.75, 23.31, 20.29, 15.83, 11.55, 8.85]),
    ("Solent", (50.807, -1.208), [8.56, 8.74, 11.01, 13.94, 17.07, 19.59, 21.62, 21.61, 19.38, 15.73, 11.88, 9.17]),
    ("Ronaldsway", (54.085, -4.632), [8.47, 8.35, 9.44, 11.48, 14.33, 16.52, 18.19, 18.15, 16.56, 13.83, 11.10, 9.17]),
    ("Baltasound", (60.749, -0.850), [6.55, 6.32, 7.35, 9.16, 11.20, 13.25, 15.08, 15.39, 13.62, 10.88, 8.47, 7.00]),
    ("St Austell", (50.337, -4.787), [9.46, 9.65, 11.33, 13.30, 16.18, 18.10, 20.60, 20.36, 18.54, 14.99, 12.30, 10.18]),
    ("Heathrow", (51.479, -0.449), [8.42, 8.98, 11.73, 15.00, 18.37, 21.57, 23.89, 23.40, 20.22, 15.81, 11.47, 8.79]),
    ("Hunstanton", (52.939, 0.493), [7.05, 7.45, 9.77, 12.65, 15.96, 18.84, 21.34, 21.28, 18.32, 14.46, 10.29, 7.56]),
    ("Durham", (54.767, -1.583), [6.86, 7.75, 9.87, 12.49, 15.42, 17.96, 20.24, 19.87, 17.36, 13.51, 9.65, 7.07]),
    ("Monks Wood", (52.400, -0.233), [7.58, 8.36, 11.05, 14.14, 17.19, 20.01, 22.63, 22.49, 19.50, 15.18, 10.68, 7.85])
  ]
-- 1. Return a list of the names of all the weather stations.
displayStationName :: Station -> String
displayStationName (name, _, _) = "\nName: " ++ name ++ "\n"

displayStationsName :: [Station] -> String
displayStationsName station = concatMap displayStationName station

-- 2. Add a new weather station given a name, location (degrees north and east) and 12 temperature values.
addStation :: Name -> Coords -> Temp -> [Station] -> [Station]
addStation name coords temp station = station ++ [(name,coords,temp)]

-- addStation "Test" (12.1,12.2) [1,2,3,4,5,6,7,8,9,10,11,12] testData

-- 3. Return all the data with all the temperature values converted to degrees Fahrenheit.

convertToF :: [Temp]-> Temp
convertToF (x:_) = map ((*1.8) . (+) 32) x


displayStationTempInF :: Station -> String
displayStationTempInF (name, coords, temp) = "\nName: " ++ name ++"\nCoordinates: " ++ show coords++"\nTemperatures: " ++ show (convertToF [temp]) ++ "\n"

displayStationsTempInF :: [Station] -> String
displayStationsTempInF station = concatMap displayStationTempInF station


--4. Given a month and a Celsius value, return a list of the names of all weather stations
-- that have a higher temperature value for that month.

filterByMonthAndTemp :: Month -> Temp -> [Station] -> [Station]
filterByMonthAndTemp  m t station= [ (name, coords, temp) | (name, coords, temp) <- station, findDataAt (convMonth m) [temp] > t]

findDataAt :: Int -> [Temp] -> Temp
findDataAt _ [] = []
findDataAt y (x:xs)
            | y <= 1 = x
            | otherwise = findDataAt (y-1) xs

convMonth :: Month -> Int
convMonth m | m == Jan = 1
            | m == Feb = 2
            | m == Mar = 3
            | m == Apr = 4
            | m == May = 5
            | m == Jun = 6
            | m == Jul = 7
            | m == Aug = 8
            | m == Sep = 9
            | m == Oct = 10
            | m == Nov = 11
            | m == Dec = 12


-- 5. Return all the data as a single string which, when output using putStr, will display the
-- data formatted neatly into a table of 15 columns giving the name, location (degrees
-- N & E formatted to 1 decimal place), and the 12 temperature values (from January to
-- December each formatted to 1 decimal place).

displayInfoInTable :: [Station] -> String
displayInfoInTable [] = []
displayInfoInTable (station:stations) = padRight 16 name ++ prepCoords [coords] ++ prepTemp [temp] ++ "\n" ++ displayInfoInTable stations
    where
        (name, coords, temp) = station

prepTemp :: [Temp] -> String
prepTemp [] = "|"
prepTemp (x:xs) = "" ++ padRight 70 (show x) ++ prepTemp xs

prepCoords :: [Coords] -> String
prepCoords [] = "|"
prepCoords (x:xs) = "|" ++ padRight 15 (show x) ++ prepCoords xs


-- 6. Replace a temperature value given a station name, a month and a new temperature.
replaceTemp :: String -> Month -> Temp -> [Station] -> [Station]
replaceTemp str m t station = [ (name, coords, temp) | (name, coords, temp) <- station, findDataAt (convMonth m) [temp] > t]

-- 7. Given a location (N and E figures), a month and a temperature value, return the name
-- of the closest weather station with an higher temperature for that month, or “none”
-- if no such station exists;

-- returnClosestStation :: [Coords] -> Month -> Temp -> [Station]
-- 

-- Helper functions

-- Display all stations
displayStations :: [Station] -> String
displayStations station = concatMap displayStation station

displayStation :: Station -> String
displayStation (name, coords, temp) = "\nName: " ++ name ++"\nCoordinates: " ++ show coords++"\nTemperatures: " ++ show (convertToF [temp]) ++ "\n"

-- Adds padding to the string to give table style
padLeft :: Int -> String -> String
padLeft n str
    | n > length str = replicate (n - length str) ' ' ++ str
    | otherwise = str

padRight :: Int -> String -> String
padRight n str
    | n > length str = str ++ replicate (n - length str) ' '
    | otherwise = str

-- roundToStr :: (PrintfArg a, Floating a) => Int -> a -> String
-- roundToStr n f = printf (printf "%%0.%df" n) f

-- round' :: Double -> Integer -> Double
-- round' num sg = (fromIntegral . round $ num * f) / f
--     where f = 10^sg
--
--  Demo
--

demo :: Int -> IO ()
demo 1 = putStr (displayStationsName testData) -- output the names of all the weather stations
demo 2 = putStr $ displayStations (addStation "Test" (12.1,12.2) [1.1,2.1,4.1,5.1,6.1,7.1,8.1,9.1,10.1,11.1,12.1] testData)-- output the data after adding a new station "Valley" with coordinates
demo 3 = putStr $ displayStationsTempInF testData -- output the data with all temperature values converted to degrees Fahrenheit
demo 4 = putStr $ displayStationsName (filterByMonthAndTemp Jan [8] testData) -- output the data withnames of weather stations with August temperature warmer than 
--          -- 20 degrees Celsius
demo 5 = putStr $ displayInfoInTable testData
-- demo 6 = putStr $ displayStationsName (replaceTemp "M Head")-- output the data after changing the temperature of "Heathrow" for July to
--          -- 25 degrees Celsius
-- demo 7 = -- output the name of the nearest weather station to location (50.2N, -0.4E)
--          -- which has a March temperature warmer than 10 degrees Celsius
-- demo 8 = -- output an animated bar chart of the temperature figures

--
-- Screen Utilities (use these to do the bar chart)
--

type ScreenPosition = (Int,Int)

-- Clears the screen
clearScreen :: IO ()
clearScreen = putStr "\ESC[2J"

-- Moves to a position on the screen
goTo :: ScreenPosition -> IO ()
goTo (x, y) = putStr ("\ESC[" ++ show y ++ ";" ++ show x ++ "H")

-- Writes a string at a position on the screen
writeAt :: ScreenPosition -> String -> IO ()
writeAt position text = do
    goTo position
    putStr text

--
-- Your bar chart code goes here
--



--
-- Your user interface (and loading/saving) code goes here
--
main :: IO ()
main = do
 putStrLn "*****************"
 loadedData <- readFile "data.txt"
 let stationData = read loadedData
 putStrLn("\nLoaded "++ show(length stationData) ++" Stations")
 mainMenu stationData

mainMenu :: [Station] -> IO ()
mainMenu stationData = do
 putStrLn "*****************"
 putStrLn " Station Manager "
 putStrLn "*****************"
 putStrLn "q. - Save and quit the program\n"
 putStrLn "1. - Show the names of all the weather stations\n"
 putStrLn "2. - Add a station\n"
 putStrLn "3. - Display the stations temperatures in Farenheit\n"
 putStrLn "4. - Input a month and a temperature and see all the stations with greater temps for that month.\n"
 putStrLn "5. - View all the stations data in a table\n"
 putStr "Option: "
 input <- getLine
 putStrLn ""
 action input stationData

action :: String -> [Station] -> IO ()
-- Save the database and exit the UI
action "q" stationData = saveAndExit stationData
action "1" stationData = displayStationsNameFromMenu stationData
action "2" stationData = addNewStation stationData
action "3" stationData = displayFarenheitFromMenu stationData
action "4" stationData = displayFilteredStations stationData
action "5" stationData = displayDataInTable stationData
action _ stationData = do
 putStrLn "Invalid input."
 putStrLn "Press any key to return to the main menu."
 input <- getLine
 mainMenu stationData

saveAndExit :: [Station] -> IO()
saveAndExit stationData =
 do
  putStrLn "Saving data to stations.txt"
  writeFile "data.txt" (show stationData)
  putStrLn "Data saved."


displayStationsNameFromMenu :: [Station] -> IO()
displayStationsNameFromMenu stationData = do
    putStrLn "*****************"
    putStr (displayStationsName stationData)
    putStrLn "*****************"
    putStrLn "Press any key to return to the main menu."
    input <- getLine
    mainMenu stationData

displayFilteredStations :: [Station] -> IO ()
displayFilteredStations stationData = do
    putStr "Enter a month and a temp to see all the stations with higher Temperature for that month\n"
    putStr "Enter a month in this Format (Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec):"
    month <- getLine
    putStr "Enter a temperature in this format [8]:"
    temp <- getLine
    if (month == "" || temp == "") 
    then do
    putStrLn "Invalid input, returning to menu."
    mainMenu stationData
    else do
        let convTemp = (read temp:: Temp)
        let convMonth = (read month:: Month)
        let filteredData = filterByMonthAndTemp convMonth convTemp stationData
        putStrLn $ displayStationsName filteredData
        putStrLn "Press any key to return to the main menu."
        input <- getLine
        mainMenu stationData

addNewStation :: [Station] -> IO()
addNewStation stationData = do
    putStrLn "Add a new station\n"
    putStr "Enter the name of the station:"
    stationName <- getLine
    putStr "Enter the Coordinates of the station in this format (x,y):"
    stationCoords <- getLine
    putStr "Enter the Temperature values of the station in this format [1.1,2.1,4.1,5.1,6.1,7.1,8.1,9.1,10.1,11.1,12.1]:"
    stationTemps <- getLine
    if stationName == "" || stationCoords == "" || stationTemps == ""
    then do
    putStrLn "Invalid input, returning to menu."
    mainMenu stationData
    else do
        let coordinates = (read stationCoords :: Coords)
        let temps = (read stationTemps :: Temp)
        putStrLn "Adding your station..."
        let newStationData = addStation stationName coordinates temps stationData
        putStrLn "Added your station!"
        putStrLn "Press any key to return to the main menu."
        input <- getLine
        mainMenu newStationData

displayFarenheitFromMenu :: [Station] -> IO ()
displayFarenheitFromMenu stationData = do
 putStrLn "*****************"
 putStr (displayStationsTempInF stationData)
 putStrLn "*****************"
 putStrLn "Press any key to return to the main menu."
 input <- getLine
 mainMenu stationData

displayDataInTable:: [Station] -> IO ()
displayDataInTable stationData = do
 putStrLn "*****************"
 putStr (displayInfoInTable stationData)
 putStrLn "*****************"
 putStrLn "Press any key to return to the main menu."
 input <- getLine
 mainMenu stationData