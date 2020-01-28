import UIKit

public func setupSlider(sdChoose:UISlider){
    sdChoose.setThumbImage(UIImage(named: "sliderThumbNormal"), for: .normal)
    sdChoose.setThumbImage(UIImage(named: "sliderThumbHighlight"), for: .highlighted)

    let insets = UIEdgeInsets(top: 1, left: 12, bottom: 0, right: 12)

    let leftTrack = UIImage(named: "sliderTrackerLeft")
    let leftImage = leftTrack!.resizableImage(withCapInsets: insets)
    sdChoose.setMinimumTrackImage(leftImage, for: .normal)

    let rightTrack = UIImage(named: "sliderTrackerRight")
    let rightImage = rightTrack!.resizableImage(withCapInsets: insets)
    sdChoose.setMaximumTrackImage(rightImage, for: .normal)
}