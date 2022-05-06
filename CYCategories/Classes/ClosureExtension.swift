//
//  ClosureExtension.swift
//  Reminder
//
//  Created by careyang on 22/4/2022.
//

import Foundation

public typealias VoidHandler = () -> Void
public typealias SingleHandler<T> = (T) -> Void
public typealias DoubleHandler<F, S> = (F, S) -> Void
public typealias ThreeHandler<F, S, T> = (F, S, T) -> Void
