//
//  ViewController.swift
//  XLKLineExample
//
//  Created by xx11dragon on 2020/5/7.
//  Copyright © 2020 xx11dragon. All rights reserved.
//

import UIKit
import XLKLine
import Alamofire

class ViewController: UIViewController {
    
    var data = [
//        [1579046400000, 8864, 8865, 8739.99, 8826.02, 150.799447],
//        [1579132800000, 8826.02, 8847.23, 8611.97, 8726.06, 1025.078774],
//        [1579219200000, 8726.06, 8991.17, 8676.81, 8915.46, 1101.286248],
//        [1579276800000, 8867.98, 8955.41, 8827.58, 8896.63, 300.565833],
//        [1579363200000, 8896.63, 9187.21, 8581.01, 8635.01, 1056.414421],
//        [1579449600000, 8635.01, 8753.26, 8536.04, 8675.24, 951.173812],
//        [1579536000000, 8675.24, 8735.89, 8617.41, 8642.16, 1155.472514],
//        [1579622400000, 8642.28, 8816.58, 8510, 8654.16, 6961.138315],
//        [1579708800000, 8654.08, 8705.24, 8328.25, 8358.07, 7551.19653],
//        [1579795200000, 8358.07, 8514.41, 8239.06, 8507.46, 7451.744826],
//        [1579881600000, 8507.47, 8525, 8273.64, 8336.63, 7328.936238],
//        [1579968000000, 8336.63, 8486.43, 8300.16, 8458, 7158.521824],
//        [1580054400000, 8458.01, 8797.81, 8453.26, 8777.05, 7505.972703],
//        [1580140800000, 8777.05, 9180.05, 8752.09, 9023.87, 8113.043578],
//        [1580227200000, 9023.31, 9429.71, 8905.12, 9285.86, 7927.505323],
//        [1580313600000, 9285.86, 9436.32, 9211.18, 9385.85, 7698.268817],
//        [1580400000000, 9385.59, 9575.97, 9215.72, 9336.77, 7809.06435],
//        [1580486400000, 9337.1, 9464.15, 9258.62, 9337.81, 7474.81277],
//        [1580572800000, 9336.38, 9473, 9173.15, 9448.61, 7517.997666],
//        [1580659200000, 9448.61, 9585.96, 9266.67, 9266.67, 7696.545645],
//        [1580745600000, 9266.38, 9353.17, 9099.83, 9210.25, 7293.304481],
//        [1580832000000, 9210.01, 9492.69, 9150.97, 9479.62, 7226.832262],
//        [1580918400000, 9479.62, 9863.64, 9470.01, 9790.2, 7853.340769],
//        [1581004800000, 9790.2, 9879.97, 9675.42, 9803.83, 7473.53019],
//        [1581091200000, 9804.31, 9866, 9670.21, 9829.28, 7173.591637],
//        [1581177600000, 9829.28, 10163.22, 9811.77, 10097.42, 7455.828628],
//        [1581264000000, 10098.24, 10187.7, 9765.01, 9865.08, 7578.505709],
//        [1581350400000, 9865.1, 10185.18, 9718.01, 10164.96, 7509.158363],
//        [1581436800000, 10164.96, 10446.3, 10164.56, 10315.98, 7882.038339],
//        [1581523200000, 10315.89, 10485.03, 10100.25, 10253.19, 8055.718185],
//        [1581609600000, 10253.82, 10337.53, 10111.7, 10251.69, 7704.969787],
//        [1581696000000, 10251.47, 10377, 9809.57, 9991.01, 7491.270681],
//        [1581782400000, 9991.14, 10098.95, 9817.8, 9861.29, 8234.174088],
//        [1581868800000, 9861.29, 9996.5, 9456.94, 9635.76, 9020.933871],
//        [1581955200000, 9637.64, 9866.7, 9579.07, 9830.62, 8325.070411],
//        [1582041600000, 9830.62, 10242.72, 9816.49, 10122.14, 8511.167406],
//        [1582128000000, 10121.61, 10250, 9359.06, 9573.85, 8742.962561],
//        [1582214400000, 9573.85, 9753, 9401.56, 9719.5, 8524.413309],
//        [1582300800000, 9719.96, 9738.03, 9560, 9631.05, 7807.177444],
//        [1582387200000, 9630.66, 9978.24, 9603.1, 9863.15, 7539.481544],
//        [1582473600000, 9863.15, 9987.13, 9598.68, 9700.68, 8130.22262],
//        [1582560000000, 9700.66, 9731.72, 9370.83, 9394, 8947.330082],
//        [1582646400000, 9394.09, 9458.91, 8982.4, 8995.69, 9408.204909],
//        [1582732800000, 8995.68, 9022.41, 8533.6, 8846.4, 9132.520123],
//        [1582819200000, 8846.39, 8972.67, 8449.99, 8719.05, 9043.958404],
//        [1582905600000, 8719.32, 8791.9, 8484.97, 8650.44, 8865.818467],
//        [1582992000000, 8650.44, 8748.38, 8516.26, 8559.01, 8658.724557],
//        [1583078400000, 8559.01, 8883.62, 8422.37, 8830, 8871.7799],
//        [1583164800000, 8829.99, 8904.77, 8703.93, 8751.67, 6175.591495],
//        [1583251200000, 8751.99, 8845.39, 8655, 8700, 6837.638698],
//        [1583337600000, 8700, 9136.1, 8674.17, 9085.15, 6327.459085],
//        [1583424000000, 9085.15, 9168.1, 8997.2, 9003.87, 6687.441619],
//        [1583510400000, 9003.62, 9141, 9001.36, 9115.84, 6133.386306],
//        [1583596800000, 9115.84, 9180.19, 8361.7, 8398.38, 6701.490115],
//        [1583683200000, 8399.49, 8399.49, 7645.95, 7737.3, 8317.326793],
//        [1583769600000, 7737.3, 8145.48, 7693.37, 7764.52, 7486.181509],
//        [1583856000000, 7770.84, 8034.23, 7740.42, 7778.14, 7491.633788],
//        [1583942400000, 7781.37, 7976.79, 5618.8, 6096.72, 8699.50157],
//        [1584028800000, 6096.74, 6220.72, 3933.5, 5217.68, 10963.352296],
//        [1584115200000, 5210.79, 5691.86, 4826.07, 5309.78, 7859.582573],
//        [1584201600000, 5311.64, 5589.62, 5070.1, 5325.82, 7245.221102],
//        [1584288000000, 5328.92, 5929.14, 4451.52, 5163.06, 7757.75809],
//        [1584374400000, 5157.33, 5438.9, 4825.8, 5357.36, 7676.966312],
//        [1584460800000, 5360.97, 5523.24, 5011.12, 5322.04, 7456.241788],
//        [1584547200000, 5328.04, 5918.45, 5148, 5893.26, 8600.000536],
//        [1584633600000, 5894.29, 6890.13, 5802.9, 6608.08, 9534.040592],
//        [1584720000000, 6608.08, 6660.35, 5693.03, 6212.79, 9521.842593],
//        [1584806400000, 6212.58, 6445.98, 5923.64, 6075.64, 9115.486515],
//        [1584892800000, 6077.16, 6585.86, 5693.53, 6229.64, 9439.940463],
//        [1584979200000, 6230, 6827.66, 6227.64, 6587.62, 9821.797426],
//        [1585065600000, 6587.38, 6950.23, 6459.93, 6622, 9488.953238],
//        [1585152000000, 6622, 6778.22, 6528.69, 6616.6, 8936.026024],
//        [1585238400000, 6616.6, 6840, 6576.48, 6623.88, 8882.391896],
//        [1585324800000, 6623.87, 6695.61, 6072.27, 6215.02, 9008.574541],
//        [1585411200000, 6215.02, 6294.01, 6032.51, 6130.43, 8485.203023],
//        [1585497600000, 6130.21, 6433.11, 5860, 6339, 9110.157706],
//        [1585584000000, 6344.55, 6600, 6310.03, 6454.07, 8847.474143],
//        [1585670400000, 6453.89, 6494.78, 6172.43, 6230.06, 8824.826979],
//        [1585756800000, 6230.06, 6827.8, 6151.79, 6802.49, 9120.401712],
//        [1585843200000, 6803.92, 7210, 6654.8, 6716, 9296.134597],
//        [1585929600000, 6716, 6897.84, 6608, 6730.8, 8608.639698],
//        [1586016000000, 6730.8, 6990.06, 6720, 6784.01, 8464.64845],
//        [1586102400000, 6784.62, 7163, 6678.65, 7144.07, 9447.278563],
//        [1586188800000, 7143.88, 7453.76, 7092.92, 7317.77, 9657.579463],
//        [1586275200000, 7317.77, 7418.07, 7082.99, 7277.93, 9564.952904],
//        [1586361600000, 7277.38, 7389.84, 7120, 7281.72, 9215.256299],
//        [1586448000000, 7281.72, 7316.32, 6745.76, 6771.52, 9246.686859],
//        [1586534400000, 6770.21, 6945.27, 6745.9, 6829.8, 9048.749264],
//        [1586620800000, 6829.8, 7021.3, 6762.69, 7015.74, 9227.01097],
//        [1586707200000, 7015.74, 7178.92, 6590.21, 6765.49, 9680.358042],
//        [1586793600000, 6766.05, 6948.24, 6731.4, 6905.49, 9806.642499],
//        [1586880000000, 6908.73, 6971.35, 6693.17, 6703.39, 9127.529612],
//        [1586966400000, 6703.39, 7149.62, 6483.28, 7045.17, 9492.927714],
//        [1587052800000, 7045.17, 7189.87, 6957.34, 7037.48, 9223.360426],
//        [1587139200000, 7039.11, 7264.09, 7016.29, 7237.69, 8638.395843],
//        [1587225600000, 7237.69, 7293.65, 7056.24, 7097.93, 8556.438928],
//        [1587312000000, 7097.16, 7211.25, 6919.09, 7069.8, 8398.528338],
//        [1587398400000, 7070.51, 7085.89, 6760.27, 6831.19, 8893.737069],
//        [1587484800000, 6831, 7119.81, 6819.23, 7112.28, 8685.410797],
//        [1587571200000, 7112.28, 7731.19, 7025.21, 7528.55, 8972.275161],
//        [1587657600000, 7530, 7605.25, 7410, 7504.88, 9234.785423],
//        [1587744000000, 7504.88, 7699.46, 7441.65, 7522.86, 8599.759723],
//        [1587830400000, 7530, 7700, 7485.5, 7546.76, 8454.369221],
//        [1587916800000, 7546.47, 7789.3, 7536.12, 7675.51, 8688.362819],
//        [1588003200000, 7675.51, 7778, 7641.63, 7716.4, 8682.301271],
//        [1588089600000, 7716.9, 8384.02, 7702.61, 8356.95, 8816.766933],
//        [1588176000000, 8357.03, 9451.91, 8336.68, 8780.08, 10004.010932],
//        [1588262400000, 8779.98, 9058.23, 8408.32, 8730.18, 9523.587085],
//        [1588348800000, 8730.18, 8965, 8655.91, 8938.11, 9200.110646],
//        [1588435200000, 8938, 9190.5, 8725.54, 8814.77, 9176.206812],
//        [1588521600000, 8812.5, 8954.77, 8522.15, 8846.51, 9507.025082],
//        [1588608000000, 8846.16, 9100, 8745.84, 8843.92, 9453.371947],
//        [1588694400000, 8843.97, 9377, 8822.23, 9272.97, 9299.426264],
//        [1588780800000, 9271.47, 9598.98, 9042.04, 9512.04, 9389.365025],
//        [1588867200000, 9512.04, 10060, 9507.35, 9939.25, 9738.547734],
//        [1588953600000, 9939.31, 9997.98, 9522.88, 9688.98, 9130.110541],
//        [1589040000000, 9689.21, 9791.43, 8179.9, 8651.39, 9683.098479],
//        [1589126400000, 8651.42, 9152.61, 8280, 8880, 9773.573488],
//        [1589212800000, 8880, 8938.39, 8208.02, 8864.11, 9690.788012],
//        [1589299200000, 8865.55, 9167.51, 8734.77, 9136.27, 9153.088332],
//        [1589385600000, 9136.27, 9935.55, 9053.03, 9750.61, 9393.068808],
//        [1589472000000, 9750.61, 9875.52, 9266.5, 9475.88, 9657.95691],
//        [1589558400000, 9476.2, 9587.42, 9220.36, 9379.73, 9263.05077],
//        [1589644800000, 9379.44, 9881.17, 9267.76, 9818.68, 9260.324387],
//        [1589731200000, 9819.57, 9948, 9480.67, 9669.47, 9283.959434],
//        [1589817600000, 9668.45, 9897.27, 9480.25, 9685.49, 9317.421188],
//        [1589904000000, 9685.44, 9839.2, 9336, 9410.76, 8828.926405],
//        [1589990400000, 9410.76, 9596.56, 8701, 9090.53, 9428.460133],
//        [1590076800000, 9090.53, 9211.76, 8820.77, 9209.01, 9299.961533],
//        [1590163200000, 9209.01, 9304.88, 8701, 9198.18, 8830.604718],
        [1590249600000, 9198.23, 9297.51, 9022.2, 9056.24, 8984.472465],
        [1590336000000, 9056.19, 9080, 8649.83, 8779.56, 9461.198057],
        [1590422400000, 8781.23, 9010.99, 8706, 8728.43, 9058.574411],
        [1590508800000, 8722.22, 9220, 8701.03, 9147.05, 9057.694317],
        [1590595200000, 9147.05, 9510, 9057.4, 9499.23, 9038.580679],
        [1590681600000, 9498.86, 9619.83, 9346.05, 9411.33, 9050.376073],
        [1590768000000, 9411.33, 9599.89, 9331.03, 9539.03, 8882.373754],
        [1590854400000, 9539.64, 9737.99, 9404.02, 9482.56, 8544.649706],
        [1590940800000, 9482.56, 9611.99, 9400, 9545.85, 7587.968628],
        [1591027200000, 9545.71, 10292.46, 9300.97, 9469.51, 8591.551224],
        [1591113600000, 9469.51, 9643.23, 9400, 9559.03, 8479.191052],
        [1591200000000, 9559.03, 9837, 9470.69, 9832.62, 8191.665147],
        [1591286400000, 9831.42, 9875.56, 9612.03, 9711.06, 8249.217017],
        [1591372800000, 9710.79, 9751.37, 9537.91, 9649.2, 7115.854157],
        [1591459200000, 9651.05, 9721.8, 9405, 9498.16, 6442.967722],
        [1591545600000, 9498.16, 9804.05, 9457.37, 9700.01, 7132.552246],
        [1591632000000, 9700.01, 9865, 9583.4, 9718.01, 6430.129633],
        [1591718400000, 9718.01, 9829.98, 9682.75, 9758.2, 6012.373611],
        [1591804800000, 9758.2, 9980.91, 9508.56, 9524.77, 6983.780116],
        [1591891200000, 9524.77, 9565.75, 9102.17, 9418.52, 7231.824721],
        [1591977600000, 9418.52, 9486.99, 9307.16, 9438.78, 6603.740835],
        [1592064000000, 9438.78, 9490.04, 9318.39, 9419.53, 6178.361581],
        [1592150400000, 9419.68, 9430.88, 9237.9, 9267.14, 3013.872676]
    ]
    
    private lazy var  klineView: XLKLine.View = {
        
        var klineView = XLKLine.View()
        view.addSubview(klineView)
        return klineView
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        klineView.frame = CGRect(x: 0,
                                 y: 100,
                                 width: UIScreen.main.bounds.size.width,
                                 height: 550)
        klineView.manager.models = data.map { KLineModel(data: $0) }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        klineView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
