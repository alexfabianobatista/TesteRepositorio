unit UContasPagarExclusaoLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons, ImgList;

type
  TFContasPagarExclusaoLote = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    BtnOK: TBitBtn;
    BtnCancelar: TBitBtn;
    ImageList1: TImageList;
    Label1: TLabel;
    CbTudo: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure CbTudoClick(Sender: TObject);
  private
    { Private declarations }
    wSQL: string;
    procedure carregar;
  public
    { Public declarations }
  end;

var
  FContasPagarExclusaoLote: TFContasPagarExclusaoLote;

implementation

uses UContasPagarCons, UContasPagar_cl, OracleData, UOracle_cl;

{$R *.dfm}

procedure TFContasPagarExclusaoLote.FormActivate(Sender: TObject);
begin
  if FContasPagarCons = nil then
    FContasPagarCons := TFContasPagarCons.Create(Application);
  if FContasPagarCons.ShowModal = mrOk then
    carregar
  else
    Close;
end;

procedure TFContasPagarExclusaoLote.carregar;
var wContas: string;
begin
  CbTudo.Checked := False;
  DMContasPagar.QContasPagar_CabCons.First;
  wContas := '';
  while not DMContasPagar.QContasPagar_CabCons.Eof do
  begin
    wContas := wContas + DMContasPagar.QContasPagar_CabConsCOD_CONTA_PAGAR_CAB.Text;
    if DMContasPagar.QContasPagar_CabCons.RecNo < DMContasPagar.QContasPagar_CabCons.RecordCount then
      wContas := wContas + ', ';

    DMContasPagar.QContasPagar_CabCons.Next;
  end;

  wContas := ' WHERE TB_CONTA_PAGAR_CAB.COD_CONTA_PAGAR_CAB IN (' + wContas + ') ';

  DMContasPagar.CdContaPagarExclusao.Close;
  DMContasPagar.QContaPagarExclusao.SQL.Text := wSQL;
  DMContasPagar.QContaPagarExclusao.SQL.Add(wContas);
  DMContasPagar.CdContaPagarExclusao.Open;
  DMContasPagar.CdContaPagarExclusao.First;
end;

procedure TFContasPagarExclusaoLote.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFContasPagarExclusaoLote.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column.FieldName = 'IND_EXCLUIR' then
  begin
    DBGrid1.Canvas.FillRect(Rect);
    if DMContasPagar.CdContaPagarExclusaoIND_EXCLUIR.Value = 'N' then
      ImageList1.Draw(DBGrid1.Canvas, Rect.Left + 5, Rect.Top + 1, 1)
    else
      ImageList1.Draw(DBGrid1.Canvas, Rect.Left + 5, Rect.Top + 1, 0);
  end;
end;

procedure TFContasPagarExclusaoLote.DBGrid1CellClick(Column: TColumn);
begin
  if Column.FieldName = 'IND_EXCLUIR' then
  begin
    DMContasPagar.CdContaPagarExclusao.Edit;
    if DMContasPagar.CdContaPagarExclusaoIND_EXCLUIR.Value = 'S' then
      DMContasPagar.CdContaPagarExclusaoIND_EXCLUIR.Value := 'N'
    else
      DMContasPagar.CdContaPagarExclusaoIND_EXCLUIR.Value := 'S';
    DMContasPagar.CdContaPagarExclusao.Post;
  end;
end;

procedure TFContasPagarExclusaoLote.FormCreate(Sender: TObject);
begin
  wSQL := DMContasPagar.QContaPagarExclusao.SQL.Text;
end;

procedure TFContasPagarExclusaoLote.BtnOKClick(Sender: TObject);
var erros: Integer;
begin
  erros := 0;
  if (MessageDlg('Deseja realmente excluir estes títulos?' + #13 + #10 + 'Esta ação não poderá ser recuperada.', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    DMContasPagar.CdContaPagarExclusao.Filtered := True;
    DMContasPagar.CdContaPagarExclusao.First;
    while not DMContasPagar.CdContaPagarExclusao.Eof do
    begin
      try
        DMOracle.ExecutaSql('DELETE FROM TB_CONTA_PAGAR_MOV WHERE COD_CONTA_PAGAR_CAB = ' + DMContasPagar.CdContaPagarExclusaoCOD_CONTA_PAGAR_CAB.Text);
        DMOracle.ExecutaSql('DELETE FROM TB_CONTA_PAGAR_CAB WHERE COD_CONTA_PAGAR_CAB = ' + DMContasPagar.CdContaPagarExclusaoCOD_CONTA_PAGAR_CAB.Text);
      except
        Inc(erros);
      end;
      DMContasPagar.CdContaPagarExclusao.Next;
    end;
    DMContasPagar.CdContaPagarExclusao.Filtered := False;

    if erros > 0 then
    begin
      MessageDlg(IntToStr(erros) + ' títulos possuem dependências e não puderam ser excluídos.' + #13 + #10 + 'Os demais foram apagados com sucesso.', mtWarning, [mbOK], 0);
      carregar;
    end
    else
    begin
      MessageDlg('Todos os títulos foram excluídos com sucesso.', mtInformation, [mbOK], 0);
      Close;
    end;
  end;
end;

procedure TFContasPagarExclusaoLote.CbTudoClick(Sender: TObject);
begin
  DMContasPagar.CdContaPagarExclusao.First;
  while not DMContasPagar.CdContaPagarExclusao.Eof do
  begin
    if CbTudo.Checked then
    begin
      if DMContasPagar.CdContaPagarExclusaoIND_EXCLUIR.Value <> 'S' then
      begin
        DMContasPagar.CdContaPagarExclusao.Edit;
        DMContasPagar.CdContaPagarExclusaoIND_EXCLUIR.Value := 'S';
        DMContasPagar.CdContaPagarExclusao.Post;
      end;
    end
    else
    begin
      if DMContasPagar.CdContaPagarExclusaoIND_EXCLUIR.Value <> 'N' then
      begin
        DMContasPagar.CdContaPagarExclusao.Edit;
        DMContasPagar.CdContaPagarExclusaoIND_EXCLUIR.Value := 'N';
        DMContasPagar.CdContaPagarExclusao.Post;
      end;
    end;

    DMContasPagar.CdContaPagarExclusao.Next;
  end;
end;

end.

