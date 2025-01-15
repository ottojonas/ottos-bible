-- Seed the random number generator with the current time
math.randomseed(os.time())

-- Function to perform a linear search on the data
function linearSearch(data, searchKey)
    for _, item in ipairs(data) do
        if item == searchKey then
            return true -- Return true if the search key is found
        end
    end
    return false -- Return false if the search key is not found
end

-- Function to perform a binary search on the data
function binarySearch(data, searchKey)
    local head = 1
    local tail = #data
    while head <= tail do
        local midPoint = math.floor((head + tail) / 2)
        if data[midPoint] == searchKey then
            return true         -- Return true if the search key is found
        elseif data[midPoint] > searchKey then
            tail = midPoint - 1 -- Search in the left half
        else
            head = midPoint + 1 -- Search in the right half
        end
    end
    return false -- Return false if the search key is not found
end

-- Function to perform bubble sort on the data
function bubbleSort(data)
    local nlen = #data - 1
    while true do
        local swap = false
        for i = 1, nlen do
            if data[i] > data[i + 1] then
                data[i], data[i + 1] = data[i + 1], data[i] -- Swap the elements
                swap = true
            end
        end
        if not swap then
            break -- Exit the loop if no swaps were made
        end
        nlen = nlen - 1
    end
    return data
end

-- Function to perform insertion sort on the data
function insertionSort(data)
    for i = 2, #data do
        local key = data[i]
        local j = i - 1
        while j >= 1 and data[j] > key do
            data[j + 1] = data[j] -- Shift elements to the right
            j = j - 1
        end
        data[j + 1] = key -- Insert the key at the correct position
    end
    return data
end

-- Function to perform merge sort on the data
function mergeSort(data)
    if #data <= 1 then
        return data -- Return the data if it has one or zero elements
    end
    local mid = math.floor(#data / 2)
    local left = mergeSort({ table.unpack(data, 1, mid) }) -- Recursively sort the left half
    local right = mergeSort({ table.unpack(data, mid + 1) }) -- Recursively sort the right half
    return merge(left, right)                              -- Merge the sorted halves
end

-- Function to merge two sorted tables
function merge(left, right)
    local result = {}
    while #left > 0 and #right > 0 do
        if left[1] <= right[1] then
            table.insert(result, table.remove(left, 1))  -- Insert the smaller element
        else
            table.insert(result, table.remove(right, 1)) -- Insert the smaller element
        end
    end
    for _, v in ipairs(left) do
        table.insert(result, v) -- Insert remaining elements from left
    end
    for _, v in ipairs(right) do
        table.insert(result, v) -- Insert remaining elements from right
    end
    return result
end

-- Function to perform quick sort on the data
function quickSort(data)
    if #data <= 1 then
        return data -- Return the data if it has one or zero elements
    end
    local pivot = data[1]
    local less = {}
    local greater = {}
    for i = 2, #data do
        if data[i] <= pivot then
            table.insert(less, data[i])    -- Collect elements less than or equal to pivot
        else
            table.insert(greater, data[i]) -- Collect elements greater than pivot
        end
    end
    less = quickSort(less)       -- Recursively sort the less list
    greater = quickSort(greater) -- Recursively sort the greater list
    table.insert(less, pivot)    -- Insert the pivot
    for _, v in ipairs(greater) do
        table.insert(less, v)    -- Append the greater list
    end
    return less
end

-- Function to prompt the user for a search key
function getSearchKey()
    io.write("Enter search key: ")
    return tonumber(io.read()) -- Read and return the search key
end

-- Function to create a data set with random numbers
function createData()
    io.write("Enter size of data set: ")
    local numItems = tonumber(io.read()) -- Read the number of items
    local data = {}
    for i = 1, numItems do
        table.insert(data, math.random(1, numItems * 2)) -- Insert random numbers into the data set
    end
    return data
end

-- Function to display the data
function viewData(data)
    for _, v in ipairs(data) do
        io.write(v, " ") -- Print each element
    end
    io.write("\n")
end

-- Main function to run the program
function main()
    local data = createData()             -- Create the data set
    local tempData = { table.unpack(data) } -- Make a copy of the original data
    local choice = ""
    while choice ~= "8" do
        print("1. Linear search")
        print("2. Binary search")
        print("3. Bubble sort")
        print("4. Insertion sort")
        print("5. Merge sort")
        print("6. View Data")
        print("7. Restore original data")
        print("8. Quit")
        print("9. Quick Sort")
        io.write("Make selection: ")
        choice = io.read()
        if choice == "1" then
            local searchKey = getSearchKey()
            print(linearSearch(data, searchKey)) -- Perform linear search
        elseif choice == "2" then
            local searchKey = getSearchKey()
            print(binarySearch(data, searchKey)) -- Perform binary search
        elseif choice == "3" then
            local start = os.clock()
            data = bubbleSort(data) -- Perform bubble sort
            local duration = (os.clock() - start) * 1000
            print(string.format("Total time: %.1f ms", duration))
        elseif choice == "4" then
            local start = os.clock()
            data = insertionSort(data) -- Perform insertion sort
            local duration = (os.clock() - start) * 1000
            print(string.format("Total time: %.1f ms", duration))
        elseif choice == "5" then
            local start = os.clock()
            data = mergeSort(data) -- Perform merge sort
            local duration = (os.clock() - start) * 1000
            print(string.format("Total time: %.1f ms", duration))
        elseif choice == "6" then
            viewData(data)                  -- View the data
        elseif choice == "7" then
            data = { table.unpack(tempData) } -- Restore the original data
        elseif choice == "9" then
            local start = os.clock()
            data = quickSort(data) -- Perform quick sort
            local duration = (os.clock() - start) * 1000
            print(string.format("Total time: %.1f ms", duration))
        end
    end
end

-- Run the main function
main()
