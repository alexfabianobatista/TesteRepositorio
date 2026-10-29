unit Registro0220;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro0220 = Class (TRegistro)
    private
    public
      UNID_CONV: String; //C
      FAT_CONV: Double; //N(X,6)
      COD_BARRA: String; //C
      
      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro0220 }

procedure TRegistro0220.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(UNID_CONV);
  addCampo(FAT_CONV, 6);

  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
