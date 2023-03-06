//
//  NetworkController.swift
//  Week5Assessment.iTunes
//
//  Created by Jake Gloschat on 3/3/23.
//

import UIKit

struct NetworkController {
    
    static func fetchAllAlbums(searchArtist: String, completion: @escaping (Result<[AlbumResult], NetworkError>) -> Void) {
        guard let baseURL = URL(string: Constants.ArtistDiscogURL.artistAlbumBaseURL) else { completion(.failure(.InvalidURL)) ; return }
        
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.path.append(Constants.ArtistDiscogURL.searchArtistPath)
        
        let artistSeachQuery = URLQueryItem(name: Constants.APIQueryKey.artistQueryKey, value: searchArtist)
        let albumQuery = URLQueryItem(name: Constants.APIQueryKey.albumQueryKey, value: Constants.APIQueryKey.albumQueryValue)
        
        urlComponents?.queryItems = [artistSeachQuery, albumQuery]
        
        guard let finalURL = urlComponents?.url else { completion(.failure(.InvalidURL)) ; return }
        print("Fetch All Albums Final URL: \(finalURL)")
        
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            if let error = error {
                completion(.failure(.thrownError(error)))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Fetch All Albums Status Code: \(response.statusCode)")
            }
            
            guard let data = data else { completion(.failure(.noData)) ; return }
            
            do {
                let topLevel = try JSONDecoder().decode(ArtistTopLevelDictionary.self, from: data)
                completion(.success(topLevel.albumResults))
            } catch {
                completion(.failure(.unableToDecode))
                return
            }
        }.resume()
    }
    
    static func fetchAlbumDetails(forCollectionId album: AlbumResult, completion: @escaping (Result<[Song], NetworkError>) -> Void) {
        guard let baseURL = URL(string: Constants.ArtistDiscogURL.artistAlbumBaseURL) else { completion(.failure(.InvalidURL)) ; return }
        
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.path.append(Constants.ArtistDiscogURL.lookUpSongPath)
        
        let songSearchQuery = URLQueryItem(name: Constants.APIQueryKey.songQueryKey, value: Constants.APIQueryKey.songQueryValue)
        let songIdQuery = URLQueryItem(name: Constants.APIQueryKey.idQueryKey, value: "\(album.collectionId)")
        
        urlComponents?.queryItems = [songSearchQuery, songIdQuery]
        
        guard let finalURL = urlComponents?.url else { completion(.failure(.InvalidURL)) ; return }
        print("Fetch Album Details Final URL: \(finalURL)")
        
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            if let error = error {
                completion(.failure(.thrownError(error)))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Fetch Album Details Status Code: \(response.statusCode)")
            }
            
            guard let data = data else { completion(.failure(.noData)) ; return }
            
            do {
                let topLevel = try JSONDecoder().decode(SongTopLevelDictionary.self, from: data)
                completion(.success(topLevel.results))
            } catch {
                completion(.failure(.unableToDecode))
                return
            }
        }.resume()
    }
    
    static func fetchImage(for item: String, completion: @escaping (Result<UIImage, NetworkError>) -> Void) {
        
        guard let finalURL = URL(string: item) else { completion(.failure(.InvalidURL)) ; return }
        print("Image Fetch Final URL: \(finalURL)")
        
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            if let error = error {
                completion(.failure(.thrownError(error)))
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else { completion(.failure(.InvalidURL)) ; return }
            
            guard let data = data, !data.isEmpty else { completion(.failure(.noData)) ; return }
            
            guard let image = UIImage(data: data) else { completion(.failure(.unableToDecode)) ; return }
            completion(.success(image))
        }.resume()
    }
} // End of Struct
