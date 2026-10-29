unit Registro1010;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro1010 = Class (TRegistro)
    private
    public
      IND_EXP: String; //C(1)                                     02
      IND_CCRF: String; //C(1)                                    03
      IND_COMB: String; //C(1)                                    04
      IND_USINA: String; //C(1)                                   05
      IND_VA: String; //C(1)                                      06
      IND_EE: String; //C(1)                                      07
      IND_CART: String; //C(1)                                    08
      IND_FORM: String; //C(1)                                    09
      IND_AER: String; //C(1)                                     10
      IND_GIAF1: String; //C(1)                                   11
      IND_GIAF3: String; //C(1)                                   12
      IND_GIAF4: String; //C(1)                                   13
      IND_REST_RESSARC_COMPL_ICMS: String; //C(1)                 14

      procedure grava;
    end;


implementation

uses UFuncoes;

{ TRegistro1100 }

procedure TRegistro1010.grava;
begin
  inherited;
        
  addCampo(bloco + registro);
  addCampo(IND_EXP, 1);
  addCampo(IND_CCRF, 1);
  addCampo(IND_COMB, 1);
  addCampo(IND_USINA, 1);
  addCampo(IND_VA, 1);
  addCampo(IND_EE, 1);
  addCampo(IND_CART, 1);
  addCampo(IND_FORM, 1);
  addCampo(IND_AER, 1);
  addCampo(IND_GIAF1, 1);
  addCampo(IND_GIAF3, 1);
  addCampo(IND_GIAF4, 1);
  addCampo(IND_REST_RESSARC_COMPL_ICMS, 1);

  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;
end.
