//
//  AddImageViewController.swift
//  ImagesTable
//
//  Created by CAUADC on 2017. 2. 6..
//  Copyright © 2017년 CAUADC. All rights reserved.
//

import UIKit
import RealmSwift

class AddImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // 이전화면에서 넘겨줄 PhotoInfo 정보
    // 넘겨주지 않을 수도 있기 때문에 옵셔널
    var photoInfoFromPrevController: PhotoInfo?
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var selectedImage: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let photoInfo = photoInfoFromPrevController {
            titleField.text = photoInfo.title
            if let image = photoInfo.imageData {
                selectedImage.image = UIImage(data: image)
            }
        }
    }
    
    @IBAction func clickSaveButton(_ sender: Any) {
        
        print("저장 버튼을 눌렀습니다")
        
        guard let image = self.selectedImage.image else {
            let alert: UIAlertController
            alert = UIAlertController(title: "알림", message: "이미지를 선택해주세요", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            
            return
        }

        print("사용자가 넣은 사진이 있습니다!")
        
        let title: String
        if let text = self.titleField.text {
            if (text.characters.count > 0) {
                title = text
                print("사용자가 작성한 제목이 있습니다!")
            }
            else {
                let alert: UIAlertController
                alert = UIAlertController(title: "알림", message: "제목을 입력해주세요", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
                
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
                
                return
            }
        }
        else {
            return
        }
        
        guard let realm = try? Realm() else {
            let alert: UIAlertController
            alert = UIAlertController(title: "오류", message: "Realm() 생성에 실패하였습니다!", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        let photoInfo: PhotoInfo
        if let infoFromPrev = self.photoInfoFromPrevController {
            photoInfo = infoFromPrev
        }
        else {
            photoInfo = PhotoInfo()
        }
        
        try? realm.write {
            // photoInfo.imageData = UIImageJPEGRepresentation(image, 1.0)      // JPG 저장
            photoInfo.imageData = UIImagePNGRepresentation(image)               // PNG 저장
            photoInfo.title = title                                             // 제목 저장
            
            // Realm에게 photoInfo를 DB에 저장해달라고 요청
            realm.add(photoInfo)
            
            // 저장을 성공했으면 이전 화면으로 돌아가기 (네비게이션 컨트롤러 pop)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func tapImageView(_ sender: UITapGestureRecognizer) {
        print("사용자가 이미지뷰를 탭했습니다.")
        
        let actionSheet: UIAlertController
        actionSheet = UIAlertController(title: "액션 선택", message: "원하는 액션을 선택해 주세요", preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: "사진함에서 가져오기", style: UIAlertActionStyle.default) { (UIAlertAction) in
            self.showImagePicker(type: .photoLibrary)
        }
        
        let action2 = UIAlertAction(title: "현재 사진 삭제", style: UIAlertActionStyle.destructive) { (UIAlertAction) in
            self.selectedImage.image = nil
        }
        
        let action3 = UIAlertAction(title: "취소하기", style: UIAlertActionStyle.cancel) { (UIAlertAction) in
            print("취소함")
            actionSheet.dismiss(animated: true, completion: nil)
        }
        
        actionSheet.addAction(action1)
        actionSheet.addAction(action2)
        actionSheet.addAction(action3)
        
        present(actionSheet, animated: true, completion: nil)
        
        // showImagePicker(type: .photoLibrary)
    }
    
    func showImagePicker(type: UIImagePickerControllerSourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = type
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        // imagePicker.modalPresentationStyle = .popover
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            selectedImage.contentMode = .scaleAspectFill
            selectedImage.image = pickedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func incrementID() -> Int {
        let realm = try! Realm()
        return (realm.objects(PhotoInfo.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
