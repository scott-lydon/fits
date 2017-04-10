

import UIKit
import Eureka
import AVFoundation

class AddLookFVC: FormViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        form +++ Section("")
            <<< TextRow(){ row in
                row.title = "Celebrity Name"
                row.placeholder = "Kanye West"
            }
            <<< TextRow(){
                $0.title = "Description"
                $0.placeholder = "Where was this taken?"
            }
            <<< LabelRow() {
                $0.title = "Image"
            }.onCellSelection({ (_, _) in
                AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo) { (authorized) in
                    if authorized {
                        let imagePicker = UIImagePickerController()
                        imagePicker.delegate = self
                        imagePicker.sourceType = .photoLibrary
                        self.present(imagePicker, animated: true)
                    }
                }
            })
            
            +++ Section("PRODUCT")
            <<< DateRow(){
                $0.title = "Date Row"
                $0.value = Date(timeIntervalSinceReferenceDate: 0)
        }
    }


}
