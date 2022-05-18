//
//  UIControlSubscriptions.swift
//  GooseML
//
//  Created by Kynan Song on 17/05/2022.
//

import Combine
import UIKit

class UIControlSubscription<SubscriberType: Subscriber, Control: UIControl>: Subscription
    where SubscriberType.Input == Control {
    private var subscriber: SubscriberType?
    private let control: Control

    init(subscriber: SubscriberType, control: Control, event: UIControl.Event) {
        self.subscriber = subscriber
        self.control = control
        control.addTarget(self, action: #selector(eventHandler), for: event)
    }

    func request(_ demand: Subscribers.Demand) {
        // No-op
    }

    func cancel() {
        subscriber = nil
    }

    @objc private func eventHandler() {
        _ = subscriber?.receive(control)
    }
}
