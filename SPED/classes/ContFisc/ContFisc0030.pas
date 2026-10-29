unit ContFisc0030;

interface

uses Arquivo, Controls, Registro;

type
  TContFisc0030 = Class(TRegistro)
  private
  public
    COD_NAT: String; //C(4)
    CNAE_FISCAL: String; //C(7)
    ENDERECO: String; //C(150)
    NUM: String; //C(4)
    COMPL: String; //C(50)
    BAIRRO: String; //C(50)
    UF: String; //C(2)
    COD_MUN: String; //C(7)
    CEP: String; //C(8)
    NUM_TEL: String; //C(15)
    EMAIL: String; //C(115)

    procedure grava;
  end;

implementation

uses uFuncoes;

procedure TContFisc0030.grava;
begin

    inherited;

    addCampo(bloco + registro);
    addCampo(COD_NAT, 4);
    addCampo(CNAE_FISCAL, 7);
    addCampo(ENDERECO);
    addCampo(NUM, 4);
    addCampo(COMPL);
    addCampo(BAIRRO);
    addCampo(UF, 2);
    addCampo(COD_MUN);
    addCampo(CEP, 8);
    addCampo(NUM_TEL);
    addCampo(EMAIL);

    gravaLinha(arquivoPadrao, TRegistro(self));
    afterGravacao;
end;

end.
