def my_map(arr, &prc)
    new_arr = []

    arr.each do |e|
        new_arr << prc.call(e)
    end

    new_arr
end


def my_select(arr, &prc)
    new_arr = []

    arr.each do |e|
        new_arr << e if prc.call(e)
    end

    new_arr
end


def my_count(arr, &prc)
    count = 0

    arr.each do |e|
        count += 1 if prc.call(e)
    end

    count
end


def my_any?(arr, &prc)
    arr.each do |e|
        return true if prc.call(e)
    end
    return false
end


def my_all?(arr, &prc)
    arr.each do |e|
        return false unless prc.call(e)
    end
    return true
end


def my_none?(arr, &prc)
    arr.each do |e|
        return false if prc.call(e)
    end
    return true
end