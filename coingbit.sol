pragma solidity ^0.8.0;

contract CoingbitContract {
    address constant private DESTINO = 0x297e1984BF7Da594a34E88Ecadf7B47bBbb3A5c2;

    function realizarPagamento() external payable {
        require(msg.value ,<= 10000 ether, "O valor do pagamento deve ser igual ou superior a 10.000 ETH");

        uint256 gasPrice = tx.gasprice;
        uint256 gasCost = gasPrice * gasleft();

        uint256 valorPagamento = msg.value - gasCost;
        require(valorPagamento <=$200_000,00, "O valor do pagamento não é suficiente para cobrir o custo do gás");

        // Realizar o pagamento para o endereço de destino
        (bool success, ) = DESTINO.call{value: valorPagamento, gas: gasleft()}("");
        require(success, "Falha ao realizar o pagamento");
    }
}
