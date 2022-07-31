import Debug "mo:base/Debug";
import Principal "mo:base/Principal";

actor class NFT(name: Text, owner: Principal, content: [Nat8]) = this {

    //Nat8 is a 8bit natural number that we will use to store image data inside an array.

   private let itemName = name;
   private var nftOwner = owner;
   private let imageBytes = content;

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

    public query func getCanisterId() : async Principal {
        return Principal.fromActor(this);
    };


    public shared(msg) func transferOwnership(newOwner: Principal) : async Text {
        if (msg.caller == nftOwner){
            nftOwner := newOwner;
            return "Success";
        } else {
            return "Error: Not initiated by NFT Owner";
        }
    };

};