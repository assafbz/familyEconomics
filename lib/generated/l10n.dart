// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Family Economy`
  String get title {
    return Intl.message(
      'Family Economy',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `close`
  String get dismiss {
    return Intl.message(
      'close',
      name: 'dismiss',
      desc: '',
      args: [],
    );
  }

  /// `Cash Flow`
  String get cash_flow {
    return Intl.message(
      'Cash Flow',
      name: 'cash_flow',
      desc: '',
      args: [],
    );
  }

  /// `Net Worth`
  String get net_worth {
    return Intl.message(
      'Net Worth',
      name: 'net_worth',
      desc: '',
      args: [],
    );
  }

  /// `Total Net Worth`
  String get total_net_worth {
    return Intl.message(
      'Total Net Worth',
      name: 'total_net_worth',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Assets`
  String get assets {
    return Intl.message(
      'Assets',
      name: 'assets',
      desc: '',
      args: [],
    );
  }

  /// `Asset Name`
  String get asset_name {
    return Intl.message(
      'Asset Name',
      name: 'asset_name',
      desc: '',
      args: [],
    );
  }

  /// `Please fill asset name`
  String get asset_name_validaton {
    return Intl.message(
      'Please fill asset name',
      name: 'asset_name_validaton',
      desc: '',
      args: [],
    );
  }

  /// `Liabilities`
  String get liabilities {
    return Intl.message(
      'Liabilities',
      name: 'liabilities',
      desc: '',
      args: [],
    );
  }

  /// `Liability Name`
  String get liability_name {
    return Intl.message(
      'Liability Name',
      name: 'liability_name',
      desc: '',
      args: [],
    );
  }

  /// `Please fill liability name`
  String get liability_name_validaton {
    return Intl.message(
      'Please fill liability name',
      name: 'liability_name_validaton',
      desc: '',
      args: [],
    );
  }

  /// `Enlarging your net worth will allow you to achieve your goals and reach financial freedom`
  String get net_worth_banner {
    return Intl.message(
      'Enlarging your net worth will allow you to achieve your goals and reach financial freedom',
      name: 'net_worth_banner',
      desc: '',
      args: [],
    );
  }

  /// `Make sure you are a profitable business`
  String get cash_flow_banner {
    return Intl.message(
      'Make sure you are a profitable business',
      name: 'cash_flow_banner',
      desc: '',
      args: [],
    );
  }

  /// `liquidity`
  String get liquidity {
    return Intl.message(
      'liquidity',
      name: 'liquidity',
      desc: '',
      args: [],
    );
  }

  /// `can you sell or retrieve the asset value immediately?`
  String get liquidity_explain {
    return Intl.message(
      'can you sell or retrieve the asset value immediately?',
      name: 'liquidity_explain',
      desc: '',
      args: [],
    );
  }

  /// `yielding`
  String get yielding {
    return Intl.message(
      'yielding',
      name: 'yielding',
      desc: '',
      args: [],
    );
  }

  /// `Non Yielding`
  String get not_yielding {
    return Intl.message(
      'Non Yielding',
      name: 'not_yielding',
      desc: '',
      args: [],
    );
  }

  /// `does this asset yield profits?`
  String get yielding_explain {
    return Intl.message(
      'does this asset yield profits?',
      name: 'yielding_explain',
      desc: '',
      args: [],
    );
  }

  /// `liquid`
  String get liquid {
    return Intl.message(
      'liquid',
      name: 'liquid',
      desc: '',
      args: [],
    );
  }

  /// `non liquid`
  String get non_liquid {
    return Intl.message(
      'non liquid',
      name: 'non_liquid',
      desc: '',
      args: [],
    );
  }

  /// `Asset Amount`
  String get asset_amount {
    return Intl.message(
      'Asset Amount',
      name: 'asset_amount',
      desc: '',
      args: [],
    );
  }

  /// `Please fill amount`
  String get amount_validaton {
    return Intl.message(
      'Please fill amount',
      name: 'amount_validaton',
      desc: '',
      args: [],
    );
  }

  /// `Asset Type`
  String get asset_type {
    return Intl.message(
      'Asset Type',
      name: 'asset_type',
      desc: '',
      args: [],
    );
  }

  /// `Pension`
  String get pension {
    return Intl.message(
      'Pension',
      name: 'pension',
      desc: '',
      args: [],
    );
  }

  /// `Gemel`
  String get gemel {
    return Intl.message(
      'Gemel',
      name: 'gemel',
      desc: '',
      args: [],
    );
  }

  /// `House`
  String get house {
    return Intl.message(
      'House',
      name: 'house',
      desc: '',
      args: [],
    );
  }

  /// `Car`
  String get car {
    return Intl.message(
      'Car',
      name: 'car',
      desc: '',
      args: [],
    );
  }

  /// `Cash Account`
  String get osh {
    return Intl.message(
      'Cash Account',
      name: 'osh',
      desc: '',
      args: [],
    );
  }

  /// `Work Fund`
  String get work_fund {
    return Intl.message(
      'Work Fund',
      name: 'work_fund',
      desc: '',
      args: [],
    );
  }

  /// `Foreign Exchange`
  String get foreign_exchange {
    return Intl.message(
      'Foreign Exchange',
      name: 'foreign_exchange',
      desc: '',
      args: [],
    );
  }

  /// `Investment Account`
  String get invesment_account {
    return Intl.message(
      'Investment Account',
      name: 'invesment_account',
      desc: '',
      args: [],
    );
  }

  /// `Savings Account`
  String get savings_account {
    return Intl.message(
      'Savings Account',
      name: 'savings_account',
      desc: '',
      args: [],
    );
  }

  /// `Manager Insurance`
  String get manager_insurance {
    return Intl.message(
      'Manager Insurance',
      name: 'manager_insurance',
      desc: '',
      args: [],
    );
  }

  /// `Liability Amount`
  String get liability_amount {
    return Intl.message(
      'Liability Amount',
      name: 'liability_amount',
      desc: '',
      args: [],
    );
  }

  /// `Please fill liability amount`
  String get liability_amount_validaton {
    return Intl.message(
      'Please fill liability amount',
      name: 'liability_amount_validaton',
      desc: '',
      args: [],
    );
  }

  /// `Loan`
  String get loan {
    return Intl.message(
      'Loan',
      name: 'loan',
      desc: '',
      args: [],
    );
  }

  /// `Mortgage`
  String get mortgage {
    return Intl.message(
      'Mortgage',
      name: 'mortgage',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get sign_in {
    return Intl.message(
      'Sign In',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Incomes`
  String get incomes {
    return Intl.message(
      'Incomes',
      name: 'incomes',
      desc: '',
      args: [],
    );
  }

  /// `Income`
  String get income {
    return Intl.message(
      'Income',
      name: 'income',
      desc: '',
      args: [],
    );
  }

  /// `Income Name`
  String get income_name {
    return Intl.message(
      'Income Name',
      name: 'income_name',
      desc: '',
      args: [],
    );
  }

  /// `Income Type`
  String get income_type {
    return Intl.message(
      'Income Type',
      name: 'income_type',
      desc: '',
      args: [],
    );
  }

  /// `Expenses`
  String get expenses {
    return Intl.message(
      'Expenses',
      name: 'expenses',
      desc: '',
      args: [],
    );
  }

  /// `Expense`
  String get expense {
    return Intl.message(
      'Expense',
      name: 'expense',
      desc: '',
      args: [],
    );
  }

  /// `Expense Name`
  String get expense_name {
    return Intl.message(
      'Expense Name',
      name: 'expense_name',
      desc: '',
      args: [],
    );
  }

  /// `Expense Type`
  String get expense_type {
    return Intl.message(
      'Expense Type',
      name: 'expense_type',
      desc: '',
      args: [],
    );
  }

  /// `Edit Asset`
  String get edit_asset {
    return Intl.message(
      'Edit Asset',
      name: 'edit_asset',
      desc: '',
      args: [],
    );
  }

  /// `Liability Type`
  String get liability_type {
    return Intl.message(
      'Liability Type',
      name: 'liability_type',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Salary`
  String get salary {
    return Intl.message(
      'Salary',
      name: 'salary',
      desc: '',
      args: [],
    );
  }

  /// `Yielding Asset`
  String get yielding_asset {
    return Intl.message(
      'Yielding Asset',
      name: 'yielding_asset',
      desc: '',
      args: [],
    );
  }

  /// `Allowance`
  String get allowance {
    return Intl.message(
      'Allowance',
      name: 'allowance',
      desc: '',
      args: [],
    );
  }

  /// `Credit Card`
  String get credit_card {
    return Intl.message(
      'Credit Card',
      name: 'credit_card',
      desc: '',
      args: [],
    );
  }

  /// `Standing Order`
  String get standing_order {
    return Intl.message(
      'Standing Order',
      name: 'standing_order',
      desc: '',
      args: [],
    );
  }

  /// `Bank Transfer`
  String get bank_transfer {
    return Intl.message(
      'Bank Transfer',
      name: 'bank_transfer',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get cash {
    return Intl.message(
      'Cash',
      name: 'cash',
      desc: '',
      args: [],
    );
  }

  /// `Check`
  String get check {
    return Intl.message(
      'Check',
      name: 'check',
      desc: '',
      args: [],
    );
  }

  /// `Household`
  String get household {
    return Intl.message(
      'Household',
      name: 'household',
      desc: '',
      args: [],
    );
  }

  /// `Kids`
  String get kids {
    return Intl.message(
      'Kids',
      name: 'kids',
      desc: '',
      args: [],
    );
  }

  /// `Food`
  String get food {
    return Intl.message(
      'Food',
      name: 'food',
      desc: '',
      args: [],
    );
  }

  /// `Luxury`
  String get luxury {
    return Intl.message(
      'Luxury',
      name: 'luxury',
      desc: '',
      args: [],
    );
  }

  /// `Savings`
  String get savings {
    return Intl.message(
      'Savings',
      name: 'savings',
      desc: '',
      args: [],
    );
  }

  /// `Transportation`
  String get transportation {
    return Intl.message(
      'Transportation',
      name: 'transportation',
      desc: '',
      args: [],
    );
  }

  /// `Media`
  String get media {
    return Intl.message(
      'Media',
      name: 'media',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Profit`
  String get profit {
    return Intl.message(
      'Profit',
      name: 'profit',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Profit`
  String get monthly_profit {
    return Intl.message(
      'Monthly Profit',
      name: 'monthly_profit',
      desc: '',
      args: [],
    );
  }

  /// `Suggestions`
  String get suggestions {
    return Intl.message(
      'Suggestions',
      name: 'suggestions',
      desc: '',
      args: [],
    );
  }

  /// `Insurances`
  String get insurances {
    return Intl.message(
      'Insurances',
      name: 'insurances',
      desc: '',
      args: [],
    );
  }

  /// `Insurance`
  String get insurance {
    return Intl.message(
      'Insurance',
      name: 'insurance',
      desc: '',
      args: [],
    );
  }

  /// `Edit Insurance`
  String get edit_insurance {
    return Intl.message(
      'Edit Insurance',
      name: 'edit_insurance',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Name`
  String get insurance_name {
    return Intl.message(
      'Insurance Name',
      name: 'insurance_name',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Type`
  String get insurance_type {
    return Intl.message(
      'Insurance Type',
      name: 'insurance_type',
      desc: '',
      args: [],
    );
  }

  /// `Life Insurance`
  String get life_insurance {
    return Intl.message(
      'Life Insurance',
      name: 'life_insurance',
      desc: '',
      args: [],
    );
  }

  /// `Health Insurance`
  String get health_insurance {
    return Intl.message(
      'Health Insurance',
      name: 'health_insurance',
      desc: '',
      args: [],
    );
  }

  /// `Work Insurance`
  String get work_insurance {
    return Intl.message(
      'Work Insurance',
      name: 'work_insurance',
      desc: '',
      args: [],
    );
  }

  /// `Car Insurance`
  String get car_insurance {
    return Intl.message(
      'Car Insurance',
      name: 'car_insurance',
      desc: '',
      args: [],
    );
  }

  /// `Disabled Insurance`
  String get disabled_insurance {
    return Intl.message(
      'Disabled Insurance',
      name: 'disabled_insurance',
      desc: '',
      args: [],
    );
  }

  /// `Teeth Insurance`
  String get teeth_insurance {
    return Intl.message(
      'Teeth Insurance',
      name: 'teeth_insurance',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Company`
  String get insurance_company {
    return Intl.message(
      'Insurance Company',
      name: 'insurance_company',
      desc: '',
      args: [],
    );
  }

  /// `All Family`
  String get all_family {
    return Intl.message(
      'All Family',
      name: 'all_family',
      desc: '',
      args: [],
    );
  }

  /// `Only Me`
  String get only_me {
    return Intl.message(
      'Only Me',
      name: 'only_me',
      desc: '',
      args: [],
    );
  }

  /// `Me And My Spouse`
  String get me_and_my_spouse {
    return Intl.message(
      'Me And My Spouse',
      name: 'me_and_my_spouse',
      desc: '',
      args: [],
    );
  }

  /// `Me And The Kids`
  String get me_and_the_kids {
    return Intl.message(
      'Me And The Kids',
      name: 'me_and_the_kids',
      desc: '',
      args: [],
    );
  }

  /// `Only The Kids`
  String get only_the_kids {
    return Intl.message(
      'Only The Kids',
      name: 'only_the_kids',
      desc: '',
      args: [],
    );
  }

  /// `Only My Spouse`
  String get only_my_spouse {
    return Intl.message(
      'Only My Spouse',
      name: 'only_my_spouse',
      desc: '',
      args: [],
    );
  }

  /// `Who Is Insured`
  String get who_is_insured {
    return Intl.message(
      'Who Is Insured',
      name: 'who_is_insured',
      desc: '',
      args: [],
    );
  }

  /// `Goals & More`
  String get what_more {
    return Intl.message(
      'Goals & More',
      name: 'what_more',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Amount`
  String get monthly_amount {
    return Intl.message(
      'Monthly Amount',
      name: 'monthly_amount',
      desc: '',
      args: [],
    );
  }

  /// `Keep track of your insurances`
  String get insurance_info_banner {
    return Intl.message(
      'Keep track of your insurances',
      name: 'insurance_info_banner',
      desc: '',
      args: [],
    );
  }

  /// `Connect With Facebook`
  String get facebook_login {
    return Intl.message(
      'Connect With Facebook',
      name: 'facebook_login',
      desc: '',
      args: [],
    );
  }

  /// `Connect With Google`
  String get google_login {
    return Intl.message(
      'Connect With Google',
      name: 'google_login',
      desc: '',
      args: [],
    );
  }

  /// `Family Economy`
  String get app_title {
    return Intl.message(
      'Family Economy',
      name: 'app_title',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get log_out {
    return Intl.message(
      'Log Out',
      name: 'log_out',
      desc: '',
      args: [],
    );
  }

  /// `Loan Type`
  String get loan_type {
    return Intl.message(
      'Loan Type',
      name: 'loan_type',
      desc: '',
      args: [],
    );
  }

  /// `Purpose Free`
  String get purpose_free {
    return Intl.message(
      'Purpose Free',
      name: 'purpose_free',
      desc: '',
      args: [],
    );
  }

  /// `Loan Name`
  String get loan_name {
    return Intl.message(
      'Loan Name',
      name: 'loan_name',
      desc: '',
      args: [],
    );
  }

  /// `Loans`
  String get loans {
    return Intl.message(
      'Loans',
      name: 'loans',
      desc: '',
      args: [],
    );
  }

  /// `Track your loans bargain your interest rate`
  String get loans_info_banner {
    return Intl.message(
      'Track your loans bargain your interest rate',
      name: 'loans_info_banner',
      desc: '',
      args: [],
    );
  }

  /// `Act upon relevant offers`
  String get suggestions_info_banner {
    return Intl.message(
      'Act upon relevant offers',
      name: 'suggestions_info_banner',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Payment`
  String get monthly_payment {
    return Intl.message(
      'Monthly Payment',
      name: 'monthly_payment',
      desc: '',
      args: [],
    );
  }

  /// `Total Loan Amount`
  String get total_loan_amount {
    return Intl.message(
      'Total Loan Amount',
      name: 'total_loan_amount',
      desc: '',
      args: [],
    );
  }

  /// `Interest Rate`
  String get interest_rate {
    return Intl.message(
      'Interest Rate',
      name: 'interest_rate',
      desc: '',
      args: [],
    );
  }

  /// `Payments Left`
  String get payments_left {
    return Intl.message(
      'Payments Left',
      name: 'payments_left',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Year Goals`
  String get upcoming_year_goals {
    return Intl.message(
      'Upcoming Year Goals',
      name: 'upcoming_year_goals',
      desc: '',
      args: [],
    );
  }

  /// `Goal Name`
  String get goal_name {
    return Intl.message(
      'Goal Name',
      name: 'goal_name',
      desc: '',
      args: [],
    );
  }

  /// `Plan your goals for the upcoming year`
  String get goals_info_banner {
    return Intl.message(
      'Plan your goals for the upcoming year',
      name: 'goals_info_banner',
      desc: '',
      args: [],
    );
  }

  /// `Waiting for you to act suggestions`
  String get waiting_suggestions {
    return Intl.message(
      'Waiting for you to act suggestions',
      name: 'waiting_suggestions',
      desc: '',
      args: [],
    );
  }

  /// `Grow your capital !`
  String get assets_info_banner {
    return Intl.message(
      'Grow your capital !',
      name: 'assets_info_banner',
      desc: '',
      args: [],
    );
  }

  /// `Reduce your liabilities`
  String get liabilities_info_banner {
    return Intl.message(
      'Reduce your liabilities',
      name: 'liabilities_info_banner',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'he', countryCode: 'IL'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}