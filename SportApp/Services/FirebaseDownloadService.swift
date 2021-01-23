//
//  FirebaseDownloadService.swift
//  SportApp
//
//  Created by Max Khizhniakov on 20.01.2021.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

protocol FirebaseServiceProtocol {
    func downloadProgramsList(completion: @escaping (([Program]) -> Void))
    func downloadVideo(_ name: String, completion: @escaping (() -> Void)) -> StorageDownloadTask
}

class FirebaseService {
    // MARK: - Properties
    lazy var databaseRef = Database.database().reference()
    lazy var storageRef = Storage.storage().reference()
    
    // MARK: - Methods
    func downloadProgramsList(completion: @escaping (([Program]) -> Void)) {
        databaseRef.observeSingleEvent(of: .value) { (snapshot) in
            guard let value = snapshot.value as? NSDictionary else { return }
            guard let programs = value["programs"] as? NSArray else { return }
            
            var result: [Program] = []
            
            for prog in programs {
                guard let program = prog as? NSDictionary else { return }
                
                let programName = program["name"] as? NSString ?? ""
                let programDescription = program["description"] as? NSString ?? ""
                let imageUrl = program["imageUrl"] as? NSString ?? ""
                let cal = program["cal"] as? NSNumber ?? 0
                let time = program["time"] as? NSNumber ?? 0
                guard let exercises = program["exercises"] as? NSArray else { return }
                
                var programExercises: [Exercise] = []
                
                for ex in exercises {
                    guard let exercise = ex as? NSDictionary else { return }
                    
                    let exerciseName = exercise["name"] as? NSString ?? ""
                    let exerciseDescription = exercise["description"] as? NSString ?? ""
                    let lenght = exercise["lenght"] as? NSNumber ?? 0
                    let videoUrl = exercise["videoUrl"] as? NSString ?? ""
                    let previewUrl = exercise["previewUrl"] as? NSString ?? ""
                    
                    let resultEx = Exercise(name: String(exerciseName),
                                            description: String(exerciseDescription),
                                            lenght: Int(truncating: lenght),
                                            videoUrl: String(videoUrl),
                                            previewUrl: String(previewUrl))
                    
                    programExercises.append(resultEx)
                }
                
                let resultProgram = Program(name: String(programName),
                                            description: String(programDescription),
                                            imageUrl: String(imageUrl),
                                            cal: Int(truncating: cal),
                                            time: Int(truncating: time),
                                            exercises: programExercises)
                
                result.append(resultProgram)
            }
            return completion(result)
        }
    }
    
    func downloadVideo(_ name: String, completion: @escaping (() -> Void)) -> StorageDownloadTask {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return storageRef.child(name).write(toFile: path.appendingPathComponent(name)) { (url, error) in
            guard error == nil else { print(error!.localizedDescription); return }
            completion()
        }
    }
}
// MARK: - Extensions
extension FirebaseService: FirebaseServiceProtocol {}
