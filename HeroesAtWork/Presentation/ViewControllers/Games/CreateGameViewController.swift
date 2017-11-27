//
//  CreateGameViewController.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/20/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import UIKit
import Core
import MagicalRecord

final class CreateGameViewController: BaseViewController {

    // MARK: -  Properties
    private lazy var context:NSManagedObjectContext = NSManagedObjectContext.mr_rootSaving()
    private lazy var heroes:[Hero] = []
    private lazy var tags:[String] = []
    
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var gameNameTextField: ABSValidateTextField!
    @IBOutlet weak var startDateView: UIView!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDateView: UIView!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var pointsToPlayLabel: UILabel!
    @IBOutlet weak var minPointsLabel: UILabel!
    @IBOutlet weak var maxPointsLabel: UILabel!
    @IBOutlet weak var pointsSlider: UISlider!
    @IBOutlet weak var tagCollectionView: UICollectionView!
    @IBOutlet weak var tagCollectionViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if (tableView.shouldUpdateHeaderViewFrame) {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    // MARK: - Private
    private func setupView() {
        let headerView = UINib(nibName: "AddTableViewHeader", bundle: Bundle.main)
        tableView.register(headerView, forHeaderFooterViewReuseIdentifier: AddTableViewHeader.identifier)
        tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedSectionHeaderHeight = 50
        tableView.estimatedRowHeight = 45
        tableView.configureHeaderView()
        
        let startDateTapGesture = UITapGestureRecognizer(target: self, action: #selector(startDateViewTapped(_:)))
        startDateView.addGestureRecognizer(startDateTapGesture)
        startDatePicker.minimumDate = Date.today
        startDatePicker.maximumDate = Date.today.date(byAddingMonths: 12)
        
        let endDateTapGesture = UITapGestureRecognizer(target: self, action: #selector(endDateViewTapped(_:)))
        endDateView.addGestureRecognizer(endDateTapGesture)
        endDatePicker.minimumDate = Date.today
        endDatePicker.maximumDate = Date.today.date(byAddingMonths: 12)
        
        pointsSlider.value = 0
        minPointsLabel.text = Game.PointsLimits.min.rawValue.description
        maxPointsLabel.text = Game.PointsLimits.max.rawValue.description
        
        if let layout = tagCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
        }
    }
    
    private func openDateSelector(forPicker picker:UIDatePicker, withLabel label:UILabel) {
        let open = picker.isHidden
        if open {
            label.text = picker.date.string(fromTemplate: "ddMMyyyy")
            label.textColor = UIColor.darkGray
        }
        
        UIView.animate(withDuration: 0.3) { [unowned self] in
            picker.isHidden = !open
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
        }
    }
    
    // MARK: - Actions
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func startDateViewTapped(_ recognizer:UITapGestureRecognizer) {
        gameNameTextField.resignFirstResponder()
        endDatePicker.isHidden = true
        openDateSelector(forPicker: startDatePicker, withLabel: startDateLabel)
    }
    
    @IBAction func endDateViewTapped(_ recognizer:UITapGestureRecognizer) {
        gameNameTextField.resignFirstResponder()
        startDatePicker.isHidden = true
        openDateSelector(forPicker: endDatePicker, withLabel: endDateLabel)
    }
    
    @IBAction func startDatePickerValueChanged(_ sender: UIDatePicker) {
        startDateLabel.text = startDatePicker.date.string(fromTemplate: "ddMMyyyy")
    }
    
    @IBAction func endDatePckerValueChanged(_ sender: UIDatePicker) {
        endDateLabel.text = endDatePicker.date.string(fromTemplate: "ddMMyyyy")
    }
    
    @IBAction func pointsSliderValueChanged(_ sender: UISlider) {
        let points = pointsSlider.value * Float(Game.PointsLimits.max.rawValue)
        pointsToPlayLabel.text = Int(points).description
    }
    
    @IBAction func addTagButtonTapped(_ sender: UIButton) {
        let atags = ["arturo", "seb", "gamarra", "mejia", "Compromiso", "calidad"]
        let index = Int(arc4random_uniform(UInt32(atags.count)))
        let aTag = atags[index]
        tags.append(aTag)
        tagCollectionView.reloadData()
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        tagCollectionViewHeightConstraint.constant = tagCollectionView.collectionViewLayout.collectionViewContentSize.height
        view.setNeedsLayout()
        view.layoutIfNeeded()
    }
    
}

// MARK: - UIBarPositioningDelegate
extension CreateGameViewController: UIBarPositioningDelegate {
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
}

// MARK: - UITextFieldDelegate
extension CreateGameViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        startDatePicker.isHidden = true
        endDatePicker.isHidden = true
    }
    
}

// MARK: - UITableViewDataSource
extension CreateGameViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2//heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension CreateGameViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let identifier = AddTableViewHeader.identifier
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: identifier) as? AddTableViewHeader else {
            return nil
        }
        headerView.titleLabel.text = NSLocalizedString("create_game_heroes_title", comment: "Heroes")
        headerView.delegate = self
        return headerView
    }
    
}

// MARK: - UICollectionViewDataSource
extension CreateGameViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagsCollectionViewCell.identifier, for: indexPath) as! TagsCollectionViewCell
        cell.titleLabel.text = tags[indexPath.item]
        return cell
    }
    
}

// MARK: - AddTableViewHeaderDelegate
extension CreateGameViewController: AddTableViewHeaderDelegate {
    
    func addTableViewHeader(_ sender: AddTableViewHeader, addButtonDidTapped button: UIButton) {
        // Show add hero
        print("Add hero")
    }
    
}



