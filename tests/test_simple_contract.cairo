// use starknet::{contractAddress};

use snforge_std::{declare, ContractClassTrait, DeclareResultTrait};

use first_test_contract::simple_contract::{ISimpleContractDispatcher, ISimpleContractDispatcherTrait};

#[test]
fn call_and_invoke() {
    let contract = declare("SimpleContract").unwrap().contract_class();
    let (contract_address, _) = contract.deploy(@array![]).unwrap();

    let dispatcher = ISimpleContractDispatcher { contract_address };

    let balance = dispatcher.get_balance();
    assert(balance == 0, 'balance == 0');

    dispatcher.increase_balance(10);

    let balance = dispatcher.get_balance();
    assert(balance == 10, 'balance == 10');
}