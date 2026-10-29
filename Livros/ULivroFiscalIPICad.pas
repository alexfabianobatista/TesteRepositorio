unit ULivroFiscalIPICad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, OracleNavigator, variants, ComObj,
  ActnList, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP;

type
  TFLivroFiscalIPICad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DBEdit12: TDBEdit;
    DBGrid1: TDBGrid;
    Label12: TLabel;
    DBEdit13: TDBEdit;
    OracleNavigator1: TOracleNavigator;
    DBRadioGroup2: TDBRadioGroup;
    RelatriodoLivroFiscalporIPI1: TMenuItem;
    DBRadioGroup1: TDBRadioGroup;
    Label13: TLabel;
    DBEdit14: TDBEdit;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    DSLctoItem: TDataSource;
    RGTipoDoc: TRadioGroup;
    RGOrigem: TRadioGroup;
    OracleNavigator2: TOracleNavigator;
    Label14: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RelatriodoLivroFiscalporIPI1Click(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RGOrigemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure OracleNavigator2Click(Sender: TObject;
      Button: TOracleNavigateBtn);
    procedure SBIncluirClick(Sender: TObject);
  private
    { Private declarations }
    function RetIdxUltimaColVisivel(DBGrid: TDBGrid): integer;
    function NaoInsereDBGrid(DBGrid: TDBGrid; DataSet: TDataSet; Key: Word): Word;
  public
    { Public declarations }
  end;

var
  FLivroFiscalIPICad: TFLivroFiscalIPICad;

implementation

uses ULivroFiscalIPI_cl, ULivroFiscalParam, UUsuario_cl, URLivroFiscalIPI,
  UFilial_cl, ULivroFiscalIPICons, UBiblioteca, URegSaida_cl,
  URegEntrada_cl, URRegEntradaIPI, URRegSaidaIPI, UNotaSaidaCons,
  UNotaSaida_cl, UNotaEntrada_cl, UNotaEntradaCons;


{$R *.DFM}


procedure TFLivroFiscalIPICad.FormActivate(Sender: TObject);
begin
  inherited;
  DMLivroFiscalIPI.QLivroFiscalIPI.Open;
//  DMLivroFiscalIPI.QLcto.Open;
end;

procedure TFLivroFiscalIPICad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMLivroFiscalIPI.QLivroFiscalIPI.Close;
//  DMLivroFiscalIPI.QLcto.Close;
end;

procedure TFLivroFiscalIPICad.RelatriodoLivroFiscalporIPI1Click(
  Sender: TObject);
var
  wDataI, wDataF: TDate;
  wAno, wMes, wDia: Word;
begin
  inherited;
  if FLivroFiscalParam = nil then
    FLivroFiscalParam := TFLivroFiscalParam.Create(Application);
  FLivroFiscalParam.PGRelatorio.Pages[22].TabVisible := True;
  if FLivroFiscalParam.ShowModal = mrOk then
    with DMLivroFiscalIPI do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FLivroFiscalParam.FmFilial22.MeFilial.Text), 'LIVRO FISCAL');

      QRLivroFiscalIPIDeb.Close;
      QRLivroFiscalIPICred.Close;
      if Trim(FLivroFiscalParam.FmFilial22.MeFilial.Text) = '' then
//    begin
//      QRLivroFiscalIPIDeb.SetVariable('FILIAL',Null);
//      QRLivroFiscalIPICred.SetVariable('FILIAL',Null);
//    end
        raise Exception.Create('Campo Filial não pode ser nulo')
      else
      begin
        QRLivroFiscalIPIDeb.SetVariable('FILIAL', FLivroFiscalParam.FmFilial22.MeFilial.Text);
        QRLivroFiscalIPICred.SetVariable('FILIAL', FLivroFiscalParam.FmFilial22.MeFilial.Text);
      end;
      QRLivroFiscalIPIDeb.SetVariable('MES', FLivroFiscalParam.MeMes.Text);
      QRLivroFiscalIPICred.SetVariable('MES', FLivroFiscalParam.MeMes.Text);
      QRLivroFiscalIPIDeb.SetVariable('ANO', FLivroFiscalParam.MeAno.Text);
      QRLivroFiscalIPICred.SetVariable('ANO', FLivroFiscalParam.MeAno.Text);
      QRLivroFiscalIPIDeb.SetVariable('DECENDIO', FLivroFiscalParam.Rg22Decendio.ItemIndex + 1);
      QRLivroFiscalIPICred.SetVariable('DECENDIO', FLivroFiscalParam.Rg22Decendio.ItemIndex + 1);
      QRLivroFiscalIPIDeb.Open;
      QRLivroFiscalIPICred.Open;

      Bib.PriUltDataVar(wDataI, wDataF, True, StrToDate('01/' +
        FLivroFiscalParam.MeMes.Text + '/' + FLivroFiscalParam.MeAno.Text));
      with DMRegEntrada do //Relatorio de Entrada
      begin
        QApuracaoEFilial.Close;
        QApuracaoEFilial.SetVariable('FILIAL', Trim(FLivroFiscalParam.FmFilial22.MeFilial.Text));
        QApuracaoEFilial.Open;

        QApuracaoEntrada_Ipi.Close;
        QApuracaoEntrada_Ipi.SetVariable('FILIAL', Trim(FLivroFiscalParam.FmFilial22.MeFilial.Text));
        QApuracaoEntrada_Ipi.SetVariable('DATA_I', wDataI);
        QApuracaoEntrada_Ipi.SetVariable('DATA_F', wDataF);
        QApuracaoEntrada_Ipi.SetVariable('NAT_OPERACAO', null);
        QApuracaoEntrada_Ipi.Open;
        if FRRegEntradaIPI = nil then
          FRRegEntradaIPI := TFRRegEntradaIPI.Create(Application);
        DecodeDate(wDataI, wAno, wMes, wDia);
        FRRegEntradaIPI.QRLabel8.Caption := Bib.NomeMes(wMes) + '/' + FormatFloat('0000', wAno);
      end;

      with DMRegSaida do //Relatorio de Saida
      begin
        QApuracaoSFilial.Close;
        QApuracaoSFilial.SetVariable('FILIAL', Trim(FLivroFiscalParam.FmFilial22.MeFilial.Text));
        QApuracaoSFilial.open;

        QApuracaoSaida_Ipi.Close;
        QApuracaoSaida_Ipi.SetVariable('FILIAL', Trim(FLivroFiscalParam.FmFilial22.MeFilial.Text));
        QApuracaoSaida_Ipi.SetVariable('DATA_I', wDataI);
        QApuracaoSaida_Ipi.SetVariable('DATA_F', wDataF);
        QApuracaoSaida_Ipi.SetVariable('NAT_OPERACAO', null);
        QApuracaoSaida_Ipi.Open;
        if FRRegSaidaIPI = nil then
          FRRegSaidaIPI := TFRRegSaidaIPI.Create(Application);
        DecodeDate(wDataI, wAno, wMes, wDia);
        FRRegSaidaIPI.QRLabel8.Caption := Bib.NomeMes(wMes) + '/' + FormatFloat('0000', wAno);
      end;

      if FRLivroFiscalIPI = nil then
        FRLivroFiscalIPI := TFRLivroFiscalIPI.Create(Application);
      if QRLivroFiscalIPIDeb.RecordCount > QRLivroFiscalIPICred.RecordCount then
        FRLivroFiscalIPI.Tipo := trDebito
      else
        FRLivroFiscalIPI.Tipo := trCredito;
      DMFilial.QFilial.Close;
      DMFilial.QFilial.SetVariable('pk', Trim(FLivroFiscalParam.FmFilial22.MeFilial.Text));
      DMFilial.QFilial.Open;
      FRLivroFiscalIPI.QRLPeriodo.Caption := 'Periodo:' + FLivroFiscalParam.MeMes.Text +
        ' de ' + FLivroFiscalParam.MeAno.Text + '/Decêndio: ' +
        FLivroFiscalParam.Rg22Decendio.Items[FLivroFiscalParam.Rg22Decendio.ItemIndex];
      FRLivroFiscalIPI.QRLInscricao.Caption := 'Insc Est.: ' + DMFilial.QFilialDESC_INSCRICAO.Text;
      FRLivroFiscalIPI.QRLCnpj.Caption := 'Cnpj.: ' + DMFilial.QFilialNUM_CGC.Text;

      if FLivroFiscalParam.RGPreview.ItemIndex = 0 then
        FRLivroFiscalIPI.QRCompoIPI.Preview
      else
        FRLivroFiscalIPI.QRCompoIPI.Print;

      QRLivroFiscalIPIDeb.Close;
      QRLivroFiscalIPICred.Close;
      with DMRegEntrada do
      begin
        QApuracaoEntrada_Ipi.Close;
        QApuracaoEFilial.Close;
      end;
      with DMRegSaida do
      begin
        QApuracaoSaida_Ipi.Close;
        QApuracaoSFilial.Close;
      end;
      DMFilial.QFilial.Close;
    end;
end;

procedure TFLivroFiscalIPICad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FLivroFiscalIPICons = nil then
    FLivroFiscalIPICons := TFLivroFiscalIPICons.Create(Application);
  with DMLivroFiscalIPI do
    if (FLivroFiscalIPICons.ShowModal = mrOk) and (not QLivroFiscalIPICons.Eof) then
    begin
      SetaRegistro(QLivroFiscalIPIConsCod_Filial.Value, QLivroFiscalIPIConsNum_Ano.Value, QLivroFiscalIPIConsNum_Mes.Value, QLivroFiscalIPIConsNum_Decendio.Value);
      RGOrigem.ItemIndex := 0;
      RGOrigemClick(sender);
    end;
end;

procedure TFLivroFiscalIPICad.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin


end;

{ Retorna o índice da última coluna visível }
function TFLivroFiscalIPICad.RetIdxUltimaColVisivel(DBGrid: TDBGrid): integer;
var
  x: integer;
begin
  Result := -1;

  for x := DBGrid.Columns.Count-1 downto 0 do
  begin
    if  DBGrid.Columns.Items[x].Visible then
      begin
        Result := x;
        Break;
      end
    ;
  end;
end;

function  TFLivroFiscalIPICad.NaoInsereDBGrid(DBGrid: TDBGrid; DataSet: TDataSet; Key: Word): Word;
begin
  { Não deixa inserir registros no DBGrid caso:
    1- estiver em modo de edição: E
    1.1- se clicar na tecla "Insert"; OU
    1.2- se clicar na tecla "Seta para baixo" E estiver no último registro; OU
    1.2- se clicar na tecla "Tab" E estiver no último registro E estiver na
         última coluna visível. }
  Result := Key;

  if  dgEditing in DBGrid.Options then
    begin
      if  ( Key = VK_INSERT )
      or  ( (Key = VK_DOWN) and (DataSet.RecNo = DataSet.RecordCount) ) then
          Result := 0
      else
        if  ( Key = VK_TAB ) and ( DataSet.RecNo = DataSet.RecordCount ) then
          begin
            if  ( DBGrid.SelectedIndex = RetIdxUltimaColVisivel(DBGrid) ) then
                Result := 0;
          end;
      
    end;
end;

procedure TFLivroFiscalIPICad.DBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  { Não permite excluir }
  if  Key = VK_DELETE then
      Key := VK_NONAME;

  { Não permite incluir }
  Key := NaoInsereDBGrid(TDBGrid(Sender), TDBGrid(Sender).DataSource.DataSet, Key);
end;

procedure TFLivroFiscalIPICad.RGOrigemClick(Sender: TObject);
begin
  inherited;
  PageControl2.Pages[2].TabVisible := (RGOrigem.ItemIndex = 0);
end;

procedure TFLivroFiscalIPICad.FormCreate(Sender: TObject);
begin
  inherited;
  PageControl2.Pages[2].TabVisible := false;
  PageControl2.ActivePageIndex := 0;
end;

procedure TFLivroFiscalIPICad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  OracleNavigator2.Enabled := DSPrimario.State in [dsInsert, dsEdit];
  OracleNavigator1.Enabled := DSPrimario.State in [dsInsert, dsEdit];
end;

procedure TFLivroFiscalIPICad.OracleNavigator2Click(Sender: TObject;
  Button: TOracleNavigateBtn);
begin
  inherited;
  if Button = nbInsert then
  begin
    with DMLivroFiscalIPI do
    begin
      if RGTipoDoc.ItemIndex = 1 then // Saídas
      begin
        if FNotaSaidaCons = nil then
          FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
        if FNotaSaidaCons.ShowModal = MrOk then
        begin
          DBGrid2.SetFocus;
          QLctoItem.Append;
          QLctoItemCOD_NOTA_ITEM.Value := DMNotaSaida.QItemNFConsCOD_NOTA_ITEM.Value;
          QLctoItemVAL_AJUSTE.Value := 0;
          QLctoItem.Post;
          QLctoItem.Edit;
          DBGrid2.SelectedIndex := 5;
          Application.ProcessMessages;
        end;
      end
      else
      begin
        if FNotaEntradaCons = nil then
          FNotaEntradaCons := TFNotaEntradaCons.Create(Application);
        if FNotaEntradaCons.ShowModal = MrOk then
        begin
          DBGrid2.SetFocus;
          QLctoItem.Append;
          QLctoItemCOD_NOTA_ITEM.Value := DMNotaEntrada.QItemNFConsCOD_NOTA_ITEM.Value;
          QLctoItemVAL_AJUSTE.Value := 0;
          QLctoItem.Post;
          QLctoItem.Edit;
          DBGrid2.SelectedIndex := 5;
          Application.ProcessMessages;
        end;
      end;
    end;
  end;
end;

procedure TFLivroFiscalIPICad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  RGOrigem.ItemIndex := 1;
end;

end.

