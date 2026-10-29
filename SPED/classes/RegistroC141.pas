unit RegistroC141;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC141 = Class (TRegistro)
    private
    public
      NUM_PARC: Integer; //N
      DT_VCTO: TDate; //N(8)
      VL_PARC: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC141 }

procedure TRegistroC141.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NUM_PARC, 0);
  addCampo(DT_VCTO, 'D');
  addCampo(VL_PARC, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
