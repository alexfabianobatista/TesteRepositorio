unit UReceituarioOtico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBPanel,
  DBCtrls;

type
  TFReceituarioOtico = class(TForm)
    DSReceituarioOticoCons: TDataSource;
    DBGrid1: TDBGrid;
    btVincularRecita: TBitBtn;
    Label1: TLabel;
    DSReceituarioOticoConsIntens: TDataSource;
    DBGrid2: TDBGrid;
    Label2: TLabel;
    btDesvincularReceita: TBitBtn;
    btVoltar: TBitBtn;
    lbInformacao: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    Label9: TLabel;
    DBPanel5: TDBPanel;
    DBPanel6: TDBPanel;
    DBPanel7: TDBPanel;
    DBPanel8: TDBPanel;
    DBPanel9: TDBPanel;
    DBPanel10: TDBPanel;
    Label10: TLabel;
    Label11: TLabel;
    DBPanel11: TDBPanel;
    DBPanel12: TDBPanel;
    DBPanel13: TDBPanel;
    DBPanel14: TDBPanel;
    DBPanel15: TDBPanel;
    DBPanel16: TDBPanel;
    DBPanel17: TDBPanel;
    DBPanel18: TDBPanel;
    DBPanel19: TDBPanel;
    DBPanel20: TDBPanel;
    Label12: TLabel;
    Label13: TLabel;
    DBMemo1: TDBMemo;
    procedure FormActivate(Sender: TObject);
    procedure btVincularRecitaClick(Sender: TObject);
    procedure btDesvincularReceitaClick(Sender: TObject);
    procedure GerenciaBotoes;
    procedure DSReceituarioOticoConsDataChange(Sender: TObject;
      Field: TField);
    procedure AtualizaInformacao;
    procedure btVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReceituarioOtico: TFReceituarioOtico;

implementation

uses UNotaSaida_cl, UOracle_cl;

{$R *.dfm}

procedure TFReceituarioOtico.FormActivate(Sender: TObject);
begin
  with DMNotaSaida do
  begin
    if QNotaSaidaCOD_CADASTRO.IsNull then
    begin
      MessageDlg('Por favor selecione uma nota que pertença ao cliente para visualizar suas receitas oftalmológicas'
        , mtError, [mbOk], 0);
      Close;
      Application.ProcessMessages;
    end
    else
    begin
      QReceituarioOticoCons.DisableControls;
      QReceituarioOticoConsItens.DisableControls;
      QReceituarioOticoCons.Close;
      QReceituarioOticoCons.SetVariable('COD_CADASTRO', QNotaSaidaCOD_CADASTRO.Value);
      QReceituarioOticoCons.Open;
      QReceituarioOticoConsItens.Close;
      QReceituarioOticoConsItens.SetVariable('COD_RECEITUARIO_OPTICO',
        QReceituarioOticoConsCOD_RECEITUARIO_OPTICO.Value);
      QReceituarioOticoConsItens.Open;
      QReceituarioOticoCons.EnableControls;
      QReceituarioOticoConsItens.EnableControls;
      if QReceituarioOticoCons.Eof then
        MessageDlg('Nenhuma receita cadastrada para o cliente '
         + DMOracle.FastSelect('NOME', 'TB_CADASTRO', 'COD_CADASTRO = '
         + QNotaSaidaCOD_CADASTRO.Text), mtError, [mbOk], 0);
      GerenciaBotoes;
    end;
  end;
end;

procedure TFReceituarioOtico.btVincularRecitaClick(Sender: TObject);
begin
  with DMNotaSaida do
  begin
    QNotaSaidaCOD_RECEITUARIO_OPTICO.Value
      := QReceituarioOticoConsCOD_RECEITUARIO_OPTICO.Value;
  end;
  GerenciaBotoes;
end;

procedure TFReceituarioOtico.btDesvincularReceitaClick(Sender: TObject);
begin
  DMNotaSaida.QNotaSaidaCOD_RECEITUARIO_OPTICO.Clear;
  GerenciaBotoes;
end;

procedure TFReceituarioOtico.GerenciaBotoes;
begin
  with DMNotaSaida do
  begin
    if QNotaSaida.State = DSBrowse then
    begin
      btVincularRecita.Enabled := false;
      btDesvincularReceita.Enabled := false
    end
    else
    begin
      btVincularRecita.Enabled := QNotaSaidaCOD_RECEITUARIO_OPTICO.IsNull;
      btDesvincularReceita.Enabled := not QNotaSaidaCOD_RECEITUARIO_OPTICO.IsNull;
    end;
  end;
  AtualizaInformacao;
end;

procedure TFReceituarioOtico.DSReceituarioOticoConsDataChange(
  Sender: TObject; Field: TField);
begin
  AtualizaInformacao;
end;

procedure TFReceituarioOtico.AtualizaInformacao;
begin
  if not DMNotaSaida.QNotaSaidaCOD_RECEITUARIO_OPTICO.IsNull then
    lbInformacao.Caption := 'Nota fiscal está vinculada à receita código '
      + DMNotaSaida.QNotaSaidaCOD_RECEITUARIO_OPTICO.Text
  else
    lbInformacao.Caption := '';
end;

procedure TFReceituarioOtico.btVoltarClick(Sender: TObject);
begin
  Close;
end;

end.
