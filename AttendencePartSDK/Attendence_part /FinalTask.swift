//
//  FinalTask.swift
//  AttendencePartSDK
//
//  Created by sang on 2/9/24.
//

import Foundation
class FinalTask{
    func mergeMaps(finaltimelist: [(key: String, value: [String])], datelist: [(key: String, value: [String])]) -> [(key: String, value: [String])] {
        var mergedMap: [(key: String, value: [String])] = []
        
        for (key, timeList) in finaltimelist {
            if let dateList = datelist.first(where: { $0.key == key })?.value {
                var mergedList: [String] = []
                let maxSize = min(dateList.count, timeList.count)
                
                for j in 0..<maxSize {
                    let mergedValue = dateList[j] + timeList[j]
                    mergedList.append(mergedValue)
                }
                
                mergedMap.append((key: key, value: mergedList))
            }
        }
        
        return mergedMap
    }
    func determinePercentages(finalResultWithPercentages: [String]) -> [String] {
        var finalResultList: [String] = []
        for (i, data) in finalResultWithPercentages.enumerated() {
            let startIndex = data.index(data.startIndex, offsetBy: 1)
            let endIndex = data.index(data.startIndex, offsetBy: data.count)
            let substring = String(data[startIndex..<endIndex])
            var datass = substring
            if datass.contains("(B)") {
                let parts = datass.components(separatedBy: "(B)")
                datass = parts[0].trimmingCharacters(in: .whitespaces)
                let percentages = "\(datass)(80%)"
                finalResultList.insert(percentages, at: i)
            } else {
                let numbers = countNumbers(in: datass)
                if numbers == 6 {
                    let percentages = "\(datass)(100%)"
                    finalResultList.insert(percentages, at: i)
                } else if numbers > 6 {
                    let percentages = "\(datass)(80%)"
                    finalResultList.insert(percentages, at: i)
                } else {
                    let percentages = "\(datass)(80%)"
                    finalResultList.insert(percentages, at: i)
                }
            }
        }
        
        return finalResultList
    }

    func countNumbers(in string: String) -> Int {
        let digits = string.filter { $0.isNumber }
        return digits.count
    }
    func convertToStringArray(from tupleArray: [(key: String, value: [String])]) -> [String] {
        var stringArray: [String] = []
        
        for (key, valueList) in tupleArray {
            for value in valueList {
                let combinedString = key + value
                stringArray.append(combinedString)
            }
        }
        
        return stringArray
    }

}
