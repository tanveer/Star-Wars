//
//  ApiController.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 12/31/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import Foundation

typealias VoidClosure = () -> ()


class ApiController {
    private static let session = URLSession.shared

    // MARK: Films

    class func fetchFilms(_ path: Path, onSuccess: @escaping ([Film]) -> ()) {
        guard let url = Endpoint.getUrlPath(path) else {
            print(Message.invalidUrl)
            return
        }
        let urlRequst = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        let task = session.dataTask(with: urlRequst) { (data, _ , error) in
            if error == nil {
                if let data = data {
                    do {
                        let films = try JSONDecoder().decode(Films.self, from: data).films
                        onSuccess(films)
                    } catch {
                        Message.log(error)
                    }
                }
            } else {
                 Message.log(error)
            }
        }
        task.resume()
    }
    // MARK: People

    class func fetchPeople(_ path: Path, onSuccess: @escaping ([People]) -> ()) {
        guard let url = Endpoint.getUrlPath(path) else {
            print(Message.invalidUrl)
            return
        }
        let urlRequst = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        let task = session.dataTask(with: urlRequst) { (data, _ , error) in
            if error == nil {
                if let data = data {
                    do {
                        let poeples = try JSONDecoder().decode(Peoples.self, from: data).poeples
                        onSuccess(poeples)
                    } catch {
                        Message.log(error)
                    }
                }
            } else {
                 Message.log(error)
            }
        }
        task.resume()
    }

    // MARK: Planets

    class func fetchPlanets(_ path: Path, onSuccess: @escaping ([Planet]) -> ()) {
        guard let url = Endpoint.getUrlPath(path) else {
           print(Message.invalidUrl)
            return
        }
        let urlRequst = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        let task = session.dataTask(with: urlRequst) { (data, _, error) in
            if error == nil {
                if let data = data {
                    do {
                        let planets = try JSONDecoder().decode(Planets.self, from: data).planets
                        onSuccess(planets)
                    } catch {
                        Message.log(error)
                    }
                }
            } else {
                 Message.log(error)
            }
        }
        task.resume()
    }

    // MARK: Species

    class func fetchSpecies(_ path: Path, onSuccess: @escaping ([Species]) -> ()) {
        guard let url = Endpoint.getUrlPath(path) else {
            print(Message.invalidUrl)
            return
        }
        let urlRequst = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        let task = session.dataTask(with: urlRequst) { (data, _ , error) in
            if error == nil {
                if let data = data {
                    do {
                        let species = try JSONDecoder().decode(kSpecies.self, from: data).species
                        onSuccess(species)
                    } catch {
                        Message.log(error)
                    }
                }
            } else {
                Message.log(error)
            }
        }
        task.resume()

    }

    // MARK: Vehicles

    class func fetchVehicles(_ path: Path, onSuccess: @escaping ([Vehicle]) -> ()) {
        guard let url = Endpoint.getUrlPath(path) else {
            print(Message.invalidUrl)
            return
        }
        let urlRequst = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        let task = session.dataTask(with: urlRequst) { (data, _ , error) in
            if error == nil {
                if let data = data {
                    do {
                        let vehicles = try JSONDecoder().decode(Vehicles.self, from: data).vehicles
                        onSuccess(vehicles)
                    } catch {
                        Message.log(error)
                    }
                }
            } else {
                 Message.log(error)
            }
        }
        task.resume()
    }

    // MARK: Starships

    class func fetchStarships(_ path: Path, onSuccess: @escaping ([Starship]) -> ()) {
        guard let url = Endpoint.getUrlPath(path) else {
            print(Message.invalidUrl)
            return
        }
        let urlRequst = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        let task = session.dataTask(with: urlRequst) { (data, _ , error) in
            if error == nil {
                if let data = data {
                    do {
                        let starships = try JSONDecoder().decode(Starships.self, from: data).starships
                        onSuccess(starships)
                    } catch {
                        Message.log(error)
                    }
                }
            } else {
                Message.log(error)
            }
        }
        task.resume()
    }
}
