using StackOverflow, HTTP

"""
    getusers(sort::string = "reputation", order::String = "desc")

    Prints 30 top users in decreasing order of their reputation(default)/creation_date/displau_name/last_modified_date
"""

function getusers(sort::String = "reputation", order::String = "desc" )

    r = HTTP.request("GET", "https://api.stackexchange.com/2.2/users?order=$(order)&sort=$(sort)&site=stackoverflow")
    
    json_obj = StackOverflow.convert_HTTP_Response_To_JSON(r)

    for (k, v) in json_obj

        if occursin("items", k)
            for item in v
                for (key, value) in item 
                    println("$(key) : $(value)")
                end
                println("\n")
            end
        end

    end

end

