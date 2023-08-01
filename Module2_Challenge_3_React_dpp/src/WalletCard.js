import React, { useState } from 'react';
import Button from '@mui/material/Button';
import Ethereum from './logo.svg';
import { ethers } from "ethers";

const provider = new ethers.BrowserProvider(window.Ethereum)

const WalletCard = () => {

    const [errorMessage, setErrorMessage] = useState(null);
    const [defaultAccount, setDefaultAccount] = useState(null);
    const [userBalance, setUserBalance] = useState(null);
    const connectwalletHandler = () => {
        if (window.Ethereum) {
            provider.send("eth_requestAccounts", []).then(async () => {
                await accountChangedHandler(provider.getSigner());
            })
        } else {
            setErrorMessage("Please Install Metamask!!!");
        }
    }
    const accountChangedHandler = async (newAccount) => {
        const address = await newAccount.getAddress();
        setDefaultAccount(address);
        const balance = await newAccount.getBalance()
        setUserBalance(ethers.formatEther(balance));
        await getuserBalance(address)
    }
    const getuserBalance = async (address) => {
        const balance = await provider.getBalance(address, "latest")
    }
    return (
        <div className="WalletCard">
            <img src={Ethereum} className="App-logo" alt="logo" />
            <h3 className="h4">
                Welcome to React DApp Metamask
            </h3>
            <Button
                style={{ background: defaultAccount ? "#A5CC82" : "white" }}
                onClick={connectwalletHandler}>
                {defaultAccount ? "Connected!!" : "Connect"}
            </Button>
            <div className="displayAccount">
                <h4 className="walletAddress">Address:{defaultAccount}</h4>
                <div className="balanceDisplay">
                    <h3>
                        Wallet Amount: {userBalance}
                    </h3>
                </div>
            </div>
            {errorMessage}
        </div>
    )
}
export default WalletCard;
