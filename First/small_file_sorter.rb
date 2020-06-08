require "fileutils"
START_PATH = File.expand_path("../", __FILE__)
SEARCH_PATH = File.expand_path("./")

#RULES:
#WILL ASSUME KEYWORD IS COMMENTED OUT IN FILE BEING SEARCHED
#IF KEYWORD IS NOT COMMENTED OUT, WILL BE CONSIDERED AN INVALID KEYWORD AND SKIP TO NEXT FILE
#KEYWORD FORMAT IS DIR_1/DIR_2/etc/ or DIR_1/DIR_2/etc, OTHER FORMATS NOT ACCEPTED
#DIR_1 WILL BE USED AS A KEY TO LOCATE and/or CREATE DIR_2 TO PLACE FILE IN
#DIR_1 MUST ALREADY EXIST
#START PATH IS THE CURRENT DIRECTORY THAT THIS PROGRAM IS LOCATED IN


#EXAMPLES FOR KEYWORD:
#path/to/dir
#path/to/dir/
#existing_dir/dir_to_be_created
#existing_dir/dir_to_be_created/
#existing_dir/specified_dir/precise_dir/final_dir
#existing_dir/specified_dir/precise_dir/final_dir/

#KEYWORD LOCATION:
#code line 1
#code line 2
#code line 3
#keyword
#empty line 4

def do_stuff_with_files(extension=".rb")
  start_dir = START_PATH
  Dir.each_child("./") do |file|
    if File.file?(file)
      keyword = find_keyword(file, extension)
      next unless keyword
      key = make_key(keyword)
      key_path = search_for_path(start_dir, key, keyword)
      next unless key_path
      unless key_location_exist?(key_path)
        FileUtils.mkdir(key_path)
      end
      FileUtils.mv file, key_path
    end
  end
end

def key_location_exist?(key)
  File.exist?(key)
end


def find_keyword(prog, ext)
  temp, ext = temp_rename(prog)
  keyword = nil
  file = File.open(temp)
  keyword = (file.to_a[-1])
  file.close
  undo_rename(temp, ext)
  return is_proper_keyword(keyword.chomp) if keyword[0] == "\#"
  false
end

def is_proper_keyword(keyword)
  return keyword[1..-1] if keyword.match? (/^(?:[^\/\\]+(?:\/|\/?$))+$/)
  false
end

def make_key(keyword)
  if keyword.count("\/") > 1
    return specified_loc(keyword)
  else
    return File.dirname(keyword)
  end
end

def specified_loc(keyword)
  until keyword.count("\/") == 0
    keyword = File.dirname(keyword)
  end
  keyword
end

def temp_rename(prog)
  temp_file = prog.dup
  temp_file.slice!(File.extname(prog))
  temp_file += ".txt"
  File.rename(prog, temp_file)
  return temp_file, File.extname(prog)
end

def undo_rename(prog, ext)
  temp_file = prog.dup
  temp_file.slice!(File.extname(prog))
  temp_file += ext
  File.rename(prog, temp_file)
  temp_file
end

##################END_READING_FILE_IN

def search_for_path(cur_dir, key, keyword)
  if directories(cur_dir).empty?
    return false
  end
  search_dirs(cur_dir, key, keyword)
end

def search_dirs(cur_dir, key, keyword)
  i = 0
  dirs = directories(cur_dir)
  new_dir = []
  until i == dirs.size
    new_dir[i] = File.expand_path(dirs[i], cur_dir)
    puts new_dir[i]
    if key == dirs[i]
      new_path = File.expand_path(keyword, cur_dir)
      return new_path 
    end
    return new_path if new_path
    i += 1
  end
  new_path = dig_deeper(new_dir, key, keyword, i, new_path)
end

def dig_deeper(new_dir_arr, key, keyword, limit, new_path)
  i = 0
  until i == limit
    new_path = search_for_path(new_dir_arr[i], key, keyword)
    return new_path if new_path
    i += 1
  end
  new_path
end

def directories(cur)
  dirs = Dir.children(cur).select { |file| File.directory?(cur + "/#{file}") && file[0] != "." } 
  dirs
end

do_stuff_with_files
