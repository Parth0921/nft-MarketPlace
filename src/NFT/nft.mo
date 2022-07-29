import Debug "mo:base/Debug";
import Principal "mo:base/Principal";

actor class NFT(name: Text, owner: Principal, content: [Nat8]) {

    //Nat8 is a 8bit natural number that we will use to store image data inside an array.

    let itemName = name;
    let nftOwner = owner;
    let imageBytes = content;

    //every time we create a new nft it will create a new canister which will have it's own unique id. Hence we will in this way create a nft

    public query func getName() : async Text {
        return itemName;
    };

    public query func getOwner() : async Principal {
        return nftOwner;
    };

    public query func getAsset() : async [Nat8] {
        return imageBytes;
    };




};