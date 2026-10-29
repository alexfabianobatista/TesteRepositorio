unit RegistroD355;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD355 = Class (TRegistro)
    private
    public
      DT_DOC: TDate; //N(8)
      CRO: Integer; //N
      CRZ: Integer; //N
      NUM_COO_FIN: Integer; //N
      GT_FIN: Double; //N(X,2)
      VL_BRT: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroD355 }

procedure TRegistroD355.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DT_DOC, 'D');
  addCampo(CRO, 0);
  addCampo(CRZ, 0);
  addCampo(NUM_COO_FIN, 0);
  addCampo(GT_FIN, 2);
  addCampo(VL_BRT, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
