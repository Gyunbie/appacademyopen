def reverser(str, &prc)
    prc.call(str.reverse)
end


def word_changer(str, &prc)
    new_str = []
    str.split(" ").each { |ele| new_str << prc.call(ele) }
    new_str.join(" ")
end


def greater_proc_value(num, prc1, prc2)
    prc1.call(num) > prc2.call(num) ? prc1.call(num) : prc2.call(num)
end


def and_selector(arr, prc1, prc2)
    new_arr = []
    arr.each do |ele|
        if (prc1.call(ele) == true && prc2.call(ele) == true)
            new_arr << ele
        end
    end
    new_arr
end


def alternating_mapper(arr, prc1, prc2)
    new_arr = []
    arr.each_with_index do |ele, idx|
        new_arr << prc1.call(ele) if idx.even?
        new_arr << prc2.call(ele) if idx.odd?
    end
    new_arr
end
