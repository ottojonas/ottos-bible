math.randomseed(os.time())

function linearSearch(data, searchKey)
    for _, item in ipairs(data) do
        if item == searchKey then
            return true
        end
    end
    return false
end

function binarySearch(data, searchKey)
    local head = 1
    local tail = #data
    while head <= tail do
        local midPoint = math.floor((head + tail) / 2)
        if data[midPoint] == searchKey then
            return true
        elseif data[midPoint] > searchKey then
            tail = midPoint - 1
        else
            head = midPoint + 1
        end
    end
    return false
end

function bubbleSort(data)
    local nlen = #data - 1
    while true do
        local swap = false
        for i = 1, nlen do
            if data[i] > data[i + 1] then
                data[i], data[i + 1] = data[i + 1], data[i]
                swap = true
            end
        end
        if not swap then
            break
        end
        nlen = nlen - 1
    end
    return data
end

function insertionSort(data)
    for i = 2, #data do
        local key = data[i]
        local j = i - 1
        while j >= 1 and data[j] > key do
            data[j + 1] = data[j]
            j = j - 1
        end
        data[j + 1] = key
    end
    return data
end

function mergeSort(data)
    if #data <= 1 then
        return data
    end
    local mid = math.floor(#data / 2)
    local left = mergeSort({table.unpack(data, 1, mid)})
    local right = mergeSort({table.unpack(data, mid + 1)})
    return merge(left, right)
end

function merge(left, right)
    local result = {}
    while #left > 0 and #right > 0 do
        if left[1] <= right[1] then
            table.insert(result, table.remove(left, 1))
        else
            table.insert(result, table.remove(right, 1))
        end
    end
    for _, v in ipairs(left) do
        table.insert(result, v)
    end
    for _, v in ipairs(right) do
        table.insert(result, v)
    end
    return result
end

function quickSort(data)
    if #data <= 1 then
        return data
    end
    local pivot = data[1]
    local less = {}
    local greater = {}
    for i = 2, #data do
        if data[i] <= pivot then
            table.insert(less, data[i])
        else
            table.insert(greater, data[i])
        end
    end
    less = quickSort(less)
    greater = quickSort(greater)
    table.insert(less, pivot)
    for _, v in ipairs(greater) do
        table.insert(less, v)
    end
    return less
end

function getSearchKey()
    io.write("Enter search key: ")
    return tonumber(io.read())
end

function createData()
    io.write("Enter size of data set: ")
    local numItems = tonumber(io.read())
    local data = {}
    for i = 1, numItems do
        table.insert(data, math.random(1, numItems * 2))
    end
    return data
end

function viewData(data)
    for _, v in ipairs(data) do
        io.write(v, " ")
    end
    io.write("\n")
end

function main()
    local data = createData()
    local tempData = {table.unpack(data)}
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
            print(linearSearch(data, searchKey))
        elseif choice == "2" then
            local searchKey = getSearchKey()
            print(binarySearch(data, searchKey))
        elseif choice == "3" then
            local start = os.clock()
            data = bubbleSort(data)
            local duration = (os.clock() - start) * 1000
            print(string.format("Total time: %.1f ms", duration))
        elseif choice == "4" then
            local start = os.clock()
            data = insertionSort(data)
            local duration = (os.clock() - start) * 1000
            print(string.format("Total time: %.1f ms", duration))
        elseif choice == "5" then
            local start = os.clock()
            data = mergeSort(data)
            local duration = (os.clock() - start) * 1000
            print(string.format("Total time: %.1f ms", duration))
        elseif choice == "6" then
            viewData(data)
        elseif choice == "7" then
            data = {table.unpack(tempData)}
        elseif choice == "9" then
            local start = os.clock()
            data = quickSort(data)
            local duration = (os.clock() - start) * 1000
            print(string.format("Total time: %.1f ms", duration))
        end
    end
end

main()