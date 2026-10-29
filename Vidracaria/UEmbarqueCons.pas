unit UEmbarqueCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants, Menus;

type
  TFEmbarqueCons = class(TFTConsulta)
    MEDataI: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    MEDataF: TMaskEdit;
    BtConsTransportador: TBitBtn;
    procedure BtProcurarClick(Sender: TObject);
    procedure BtConsTransportadorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEmbarqueCons: TFEmbarqueCons;

implementation

uses UEmbarque_cl, UCadastroCons, UCadastro_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFEmbarqueCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMEmbarque do
  begin
    QEmbarqueCons.Close;
    if Trim(METexto.Text) = '' Then
      QEmbarqueCons.SetVariable('TRANSPORTADOR',Null)
    else
      QEmbarqueCons.SetVariable('TRANSPORTADOR',METexto.Text);
    QEmbarqueCons.SetVariable('DATA_I',MEDataI.Text);
    QEmbarqueCons.SetVariable('DATA_F',MEDataF.Text);
    QEmbarqueCons.Open;
  end;
end;

procedure TFEmbarqueCons.BtConsTransportadorClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    METexto.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFEmbarqueCons.FormCreate(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VETRO') or
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ') Then
  Begin
    MEDataI.Text := DateToStr( Date );
    MEDataF.Text := DateToStr( Date );
  end
  else
  Begin
    MEDataI.Text := DateToStr( Date-2 );
    MEDataF.Text := DateToStr( Date );
  end;
end;

end.
