unit UCidadeCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, Menus, ComCtrls,
  ActnList;

type
  TFCidadeCons = class(TFTConsulta)
    BitBtn1: TBitBtn;
    ActionList1: TActionList;
    StatusBar1: TStatusBar;
    Action1: TAction;
    procedure BtProcurarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure METextoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure Proc_Consulta_Cidade;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCidadeCons: TFCidadeCons;

implementation

uses UCidade_cl, UCidadeCad, UParamSistema_cl;

{$R *.DFM}

procedure TFCidadeCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  Proc_Consulta_Cidade;
 // With DMCidade do
//  Begin
//    QCidadeCons.Close;
//    QCidadeCons.SetVariable('NOME_CIDADE',Trim(METexto.Text));
//    QCidadeCons.Open;
//  End;
end;

procedure TFCidadeCons.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FCidadeCad = Nil then
    FCidadeCad := TFCidadeCad.Create(Application);
  FCidadeCad.ShowModal;
end;

procedure TFCidadeCons.Action1Execute(Sender: TObject);
begin
  inherited;
  //if FImpressoraFiscal = Nil then
//    FImpressoraFiscal := TFImpressorafiscal.Create(Application);
//  FImpressoraFiscal.ShowModal;
end;

procedure TFCidadeCons.Proc_Consulta_Cidade;
var
  wSql: string;
begin
  with DMCidade do
  begin
    QCidadeCons.Close;
    QCidadeCons.Sql.Clear;
    wSql := 'SELECT COD_CIDADE, DESC_CIDADE, COD_ESTADO, COD_PRACA, COD_DFC, COD_MUNICIPIO_SC, COD_CIDADE_IBGE FROM TB_CIDADE';
    if Trim(METexto.Text) <> '' then
      wSql := wSql + ' WHERE UPPER(DESC_CIDADE) like ' + char(39) + UPPERCASE(Trim(METexto.Text)) + '%' + chr(39);
    QCidadeCons.Sql.add(wSql);
    //wSql := QCidadeCons.SQL.Text;
    //showmessage(wSql);
    QCidadeCons.Open;
  end;
end;

procedure TFCidadeCons.METextoChange(Sender: TObject);
begin
  inherited;
  if Trim(METexto.Text) <> '' then
    Proc_Consulta_Cidade;
end;

procedure TFCidadeCons.FormCreate(Sender: TObject);
begin
  inherited;
  tedit(METexto).CharCase := ecUpperCase;
end;

end.
