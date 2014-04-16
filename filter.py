from pandas    import read_csv, DataFrame
import re


if __name__ == "__main__":
  filename = "all.csv" 
  series   = open("series.csv", "w")
  data     = read_csv(filename, skipinitialspace=True)
  parts    = data[data['title'].str.contains(".*Часть.*", re.IGNORECASE)]
  groups   = parts.groupby('author').groups
  i = 0
  for key, value in groups.items():
    for post_id in value:
      if(len(value) > 1):
        record = data.iloc[post_id]
     #print(record['title'])
        print(key+','+record['title'] + ',' + str(record['views'])+","+ str(int(record['favors'])) + ',' + str(record['score']), file=series)
