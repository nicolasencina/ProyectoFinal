function [name, class, id] = split_name(name)
class = name(2:4);
id = name(5:6);
end