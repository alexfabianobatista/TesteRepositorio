unit UOrdemServicoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFOrdemServicoCons = class(TFTConsulta)
    MEDataI: TMaskEdit;
    MEDataF: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    BtConsCadastro: TBitBtn;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOrdemServicoCons: TFOrdemServicoCons;

implementation

uses UOrdemServico_cl, UCadastroCons, UCadastro_cl;

{$R *.DFM}

procedure TFOrdemServicoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMOrdemServico do
  begin
    QOrdemServicoCons.Close;
    QOrdemServicoCons.ParamByName('DATA_I').AsDate := StrToDate(MEDataI.Text);
    QOrdemServicoCons.ParamByName('DATA_F').AsDate := StrToDate(MEDataF.Text);
    If Trim(METexto.Text) = '' Then
      QOrdemServicoCons.ParamByName('CADASTRO').Clear
    Else
      QOrdemServicoCons.ParamByName('CADASTRO').AsFloat := StrToFloat(METexto.Text);
    QOrdemServicoCons.Open;
  end;
end;

procedure TFOrdemServicoCons.FormCreate(Sender: TObject);
begin
  inherited;
  MEDataI.Text := DateToStr(Date-15);
  MEDataF.Text := DateToStr(Date);
end;

procedure TFOrdemServicoCons.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    METexto.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

end.
