//
//  PieChartManager.swift
//  RouletteSample
//
//  Created by Masato Takamura on 2021/07/10.
//

import Foundation
import Charts

struct CustomChartColor {
    let tenColorsSet: [NSUIColor] = [
        NSUIColor(hex: "ff3332"), //赤
        NSUIColor(hex: "ff6566"), //ピンク
        NSUIColor(hex: "9a66ff"), //紫
        NSUIColor(hex: "3366ff"), //青
        NSUIColor(hex: "7fcbff"), //水色
        NSUIColor(hex: "4bffcc"), //青緑
        NSUIColor(hex: "00cc66"), //緑
        NSUIColor(hex: "7fe419"), //黄緑
        NSUIColor(hex: "e5e54b"), //黄色
        NSUIColor(hex: "e59818"), //オレンジ
    ]
}

struct PieChartManager {
    func setup(_ pieChartView: PieChartView) {
        //Viewの背景
        pieChartView.backgroundColor = .darkGray
        //entry label styling
        pieChartView.entryLabelColor = .white
        pieChartView.entryLabelFont = .systemFont(ofSize: 12)
        //グラフの余白
        pieChartView.setExtraOffsets(left: 10, top: 10, right: 10, bottom: 10)
        //グラフの注釈を表示/非表示
        pieChartView.legend.enabled = false
        //グラフをタッチしたときのハイライト
        pieChartView.highlightPerTapEnabled = false
        //表示アニメーション
        pieChartView.animate(xAxisDuration: 1.0)
        
    }
    
    func setData(_ pieChartView: PieChartView, data: [String]) {
        
        var dataEntries: [PieChartDataEntry] = []
        
        dataEntries = data.compactMap({
            PieChartDataEntry(value: 10, label: $0)
        })
        let dataSet = PieChartDataSet(entries: dataEntries)
        //labelの表示/非表示
        dataSet.drawValuesEnabled = false
        //グラフの色
        dataSet.setColors(CustomChartColor().tenColorsSet, alpha: 0.8)
        //labelの色
        dataSet.valueTextColor = .blue
        //labelのfont
        dataSet.valueFont = .boldSystemFont(ofSize: 12)
        
        pieChartView.data = PieChartData(dataSet: dataSet)
    }
    
    func getSelectedIndex(dataCount: Int, randomAngle: Int) -> Int {
        //Pie１つ分の中心角
        let unitAngle = 360 / dataCount
        let selectedIndex = dataCount - 1 - Int(randomAngle / unitAngle)
        return selectedIndex
    }
}
