unit RegistroC460;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC460 = Class (TRegistro)
    private
    public
      COD_MOD: String; //C(2)
      COD_SIT: Integer; //N(2)
      NUM_DOC: Integer; //N
      DT_DOC: TDate; //N(8)
      VL_DOC: Double; //N(X,2)
      VL_PIS: Double; //N(X,2)
      VL_COFINS: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC460 }

procedure TRegistroC460.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_MOD, 2);
  addCampo(COD_SIT, 2);
  addCampo(NUM_DOC, 0);
  addCampo(DT_DOC, 'D');
  addCampo(VL_DOC, 2);
  addCampo(VL_PIS, 2);
  addCampo(VL_COFINS, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end. 
